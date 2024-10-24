import SwiftUI
import SDWebImageSwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject var stockService: StockRepository
    @EnvironmentObject var portfolioRep: PortfolioRepository
    
    @State private var isViewVisible: Bool = false
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("Portfolio")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                    .padding(.top, 32)
                
                VStack(spacing: 0) {
                    Text("Wallet Balance")
                        .font(.custom("TTTravelsTrl-Medium", size: 16))
                        .foregroundColor(.primaryTextColor)
                    
                    Text("$ \(portfolioRep.balance.formattedNumber())")
                        .font(.custom("TTTravelsTrl-Bold", size: 42))
                        .foregroundColor(.primaryTextColor)
                        .padding()
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(
                            LinearGradient(colors: [
                                Color.init(red: 0, green: 97/255, blue: 1),
                                Color.init(red: 97/255, green: 0, blue: 1)
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                )
                .padding([.horizontal, .top])
                .offset(y: isViewVisible ? 0 : -150)
                .opacity(isViewVisible ? 1 : 0)
                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                
                HStack {
                    Text("Your Stocks")
                        .font(.custom("TTTravelsTrl-Medium", size: 24))
                        .foregroundColor(.primaryTextColor)
                    Spacer()
                }
                .padding([.top, .horizontal])
                .offset(y: isViewVisible ? 0 : -150)
                .opacity(isViewVisible ? 1 : 0)
                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                
                if portfolioRep.portfolio.isEmpty {
                     Spacer()
                    Text("Portfolio is empty!")
                        .font(.custom("TTTravelsTrl-Bold", size: 32))
                        .foregroundColor(.primaryTextColor)
                        .padding()
                        .offset(y: isViewVisible ? 0 : 150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isViewVisible)
                     Spacer()
                } else {
                    ScrollView {
                        let stockItems = stockService.stockItems.filter { item in portfolioRep.portfolio.contains { sec in
                            item.ticker == sec.ticker
                        } }
                        ForEach(stockItems.indices, id: \.self) { stockItemIndex in
                            let stockItem = stockItems[stockItemIndex]
                            NavigationLink(destination: DetailsStockItemView(stockItem: stockItem)
                                .navigationBarBackButtonHidden()
                                .environmentObject(stockService)
                                .environmentObject(portfolioRep)) {
                                    PortfolioListItem(stockItem: stockItem)
                                        .environmentObject(stockService)
                                        .environmentObject(portfolioRep)
                                        .skeleton(with: isLoading,
                                                  animation: .pulse(),
                                                  shape: .rectangle,
                                                  lines: 2,
                                                  scales: [1: 0.5])
                                        .padding(.horizontal)
                                        .padding(.top, 4)
                                        .offset(y: isViewVisible ? 0 : 150)
                                        .opacity(isViewVisible ? 1 : 0)
                                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(5 + stockItemIndex)), value: isViewVisible)
                                }
                        }
                    }
                }
            }
            .preferredColorScheme(.dark)
            .background(
                Image("questions_background")
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .onAppear {
                isViewVisible = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    isLoading = false
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PortfolioListItem: View {
    
    var stockItem: StockItem
    @EnvironmentObject var stockService: StockRepository
    @EnvironmentObject var portfolioRep: PortfolioRepository
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: "\(stockItem.branding.iconUrl)?apiKey=\(APIConfig.apiKey)"))
                .resizable()
                .frame(width: 62, height: 62)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(52)
            
            let price = stockService.stockPrices.filter { $0.symbol == stockItem.ticker }[0]
            
            VStack(alignment: .leading) {
                Text(stockItem.name)
                    .font(.custom("TTTravelsTrl-Bold", size: 16))
                    .foregroundColor(.primaryTextColor)
                    .padding(.leading, 4)
                    .multilineTextAlignment(.leading)
                
                let assetItem = portfolioRep.portfolio.filter { $0.ticker == stockItem.ticker }
                
                if assetItem.isEmpty {
                    Text("0 units")
                        .font(.custom("TTTravelsTrl-Medium", size: 12))
                        .foregroundColor(.secondaryTextColor)
                        .padding(.leading, 4)
                        .multilineTextAlignment(.leading)
                } else {
                    Text("\(assetItem[0].quantity.formattedNumber()) units")
                        .font(.custom("TTTravelsTrl-Medium", size: 12))
                        .foregroundColor(.secondaryTextColor)
                        .padding(.leading, 4)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Spacer()
            
            if price.changeInPercents > 0 {
                Image("graphic_up")
                    .resizable()
                    .frame(width: 90, height: 50)
            } else {
                Image("graphic_down")
                    .resizable()
                    .frame(width: 90, height: 50)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("$\(price.preMarket.formattedNumber())")
                    .font(.custom("TTTravelsTrl-Bold", size: 15))
                    .foregroundColor(.primaryTextColor)
                if price.changeInPercents > 0 {
                    Text("+\(price.changeInPercents.formattedNumber())%")
                        .font(.custom("TTTravelsTrl-Medium", size: 12))
                        .foregroundColor(Color.init(red: 10/255, green: 1, blue: 150/255))
                        .padding(.top, 2)
                } else {
                    Text("\(price.changeInPercents.formattedNumber())%")
                        .font(.custom("TTTravelsTrl-Medium", size: 12))
                        .foregroundColor(Color.init(red: 1, green: 0, blue: 46/255))
                        .padding(.top, 2)
                }
            }
        }
    }
    
}

#Preview {
    PortfolioView()
        .environmentObject(StockRepository())
        .environmentObject(PortfolioRepository())
}
