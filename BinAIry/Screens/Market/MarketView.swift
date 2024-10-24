import SwiftUI
import SkeletonUI
import SDWebImageSwiftUI

struct MarketView: View {
    
    @EnvironmentObject var stockService: StockRepository
    @EnvironmentObject var portfolioRep: PortfolioRepository
    @State private var isViewVisible: Bool = false
    @State private var isLoading: Bool = true
    
    @State var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Market")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                    .padding(.top, 32)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 62, style: .continuous)
                        .fill(Color.bottomNavColor)
                        .frame(height: 60)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                    
                    RoundedRectangle(cornerRadius: 62, style: .continuous)
                        .fill(Color.init(red: 59/255, green: 63/255, blue: 88/255))
                        .frame(width: (UIScreen.main.bounds.width - 42) / 2, height: 55)
                        .offset(x: selectedTab == 0 ? 0 : (UIScreen.main.bounds.width - 32) / 2)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                    
                    HStack {
                        Button {
                            withAnimation(.linear(duration: 0.3)) {
                                selectedTab = 0
                            }
                        } label: {
                            Text("ALL")
                                .font(.custom("TTTravelsTrl-Bold", size: 16))
                                .foregroundColor(selectedTab == 0 ? .primaryTextColor : .secondaryTextColor)
                                .frame(maxWidth: .infinity)
                                .offset(y: isViewVisible ? 0 : -150)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                        }
                        
                        Button {
                            withAnimation(.linear(duration: 0.3)) {
                                selectedTab = 1
                            }
                        } label: {
                            Text("AI recommended")
                                .font(.custom("TTTravelsTrl-Bold", size: 16))
                                .foregroundColor(selectedTab == 1 ? .primaryTextColor : .secondaryTextColor)
                                .frame(maxWidth: .infinity)
                                .offset(y: isViewVisible ? 0 : -150)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                        }
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        if selectedTab == 0 {
                            ForEach(stockService.stockItems, id: \.ticker) { stockItem in
                                NavigationLink(destination: DetailsStockItemView(stockItem: stockItem)
                                    .navigationBarBackButtonHidden()
                                    .environmentObject(stockService)
                                    .environmentObject(portfolioRep)) {
                                    MarketStockItem(stockItem: stockItem)
                                        .environmentObject(stockService)
                                        .skeleton(with: isLoading,
                                          animation: .pulse(),
                                          shape: .rectangle,
                                          lines: 2,
                                          scales: [1: 0.5])
                                        .padding(.horizontal)
                                }
                            }
                        } else {
                            ForEach(generateTodayAIRecomendations(), id: \.ticker) { stockItem in
                                NavigationLink(destination: DetailsStockItemView(stockItem: stockItem)
                                    .navigationBarBackButtonHidden()
                                    .environmentObject(stockService)
                                    .environmentObject(portfolioRep)) {
                                    MarketStockItem(stockItem: stockItem)
                                        .environmentObject(stockService)
                                        .skeleton(with: isLoading,
                                          animation: .pulse(),
                                          shape: .rectangle,
                                          lines: 2,
                                          scales: [1: 0.5])
                                        .padding(.horizontal)
                                }
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
    
    private func generateTodayAIRecomendations() -> [StockItem] {
        var stockIds = UserDefaults.standard.string(forKey: "ai_stocks_recomendations") ?? ""
        if stockIds.isEmpty {
            let shuffledStocks = stockService.stockItems.shuffled()
            let randomCount = Int.random(in: 2...10)
            let takedStockItems = shuffledStocks.prefix(randomCount)
            stockIds = takedStockItems.map { $0.ticker }.joined(separator: ",")
            UserDefaults.standard.set(stockIds, forKey: "ai_stocks_recomendations")
        }
        return stockService.stockItems.filter { stockIds.contains($0.ticker) }
    }
    
}

#Preview {
    MarketView()
        .environmentObject(StockRepository())
        .environmentObject(PortfolioRepository())
}

struct MarketStockItem: View {
    
    var stockItem: StockItem
    @EnvironmentObject var stocksManager: StockRepository
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: "\(stockItem.branding.iconUrl)?apiKey=\(APIConfig.apiKey)"))
                .resizable()
                .frame(width: 62, height: 62)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(52)
            
            Text(stockItem.name)
                .font(.custom("TTTravelsTrl-Bold", size: 14))
                .foregroundColor(.primaryTextColor)
                .padding(.leading, 4)
                .multilineTextAlignment(.leading)
            
            let price = stocksManager.stockPrices.filter { $0.symbol == stockItem.ticker }.first
            
            Spacer()
            
            if let price = price {
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
        .padding(.bottom)
    }
    
}
