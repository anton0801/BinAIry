import SwiftUI
import SDWebImageSwiftUI

struct DetailsStockItemView: View {
    
    @Environment(\.presentationMode) var presMode
    var stockItem: StockItem
    @EnvironmentObject var stockService: StockRepository
    @EnvironmentObject var portfolioRep: PortfolioRepository
    @State private var isViewVisible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        presMode.wrappedValue.dismiss()
                    } label: {
                        Image("back_btn")
                            .resizable()
                            .frame(width: 42, height: 42)
                    }
                    
                    Spacer()
                    
                    Text(stockItem.name)
                        .font(.custom("TTTravelsTrl-Bold", size: 26))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Image("back_btn")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .opacity(0)
                }
                .padding(.horizontal)
                
                let price = stockService.stockPrices.filter { $0.symbol == stockItem.ticker }[0]
                
                HStack {
                    WebImage(url: URL(string: "\(stockItem.branding.iconUrl)?apiKey=\(APIConfig.apiKey)"))
                        .resizable()
                        .frame(width: 62, height: 62)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(52)
                    
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
                            Text("\(assetItem[0].quantity) units")
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
                .padding([.top, .horizontal])
                .offset(y: isViewVisible ? 0 : -150)
                .opacity(isViewVisible ? 1 : 0)
                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                
                GraphicView(htmlString: GraphicGenerator.generateGraphicCode(ticker: stockItem.ticker))
                    .padding(.top)
                    .frame(height: 400)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                
                HStack(spacing: 20) {
                    VStack {
                        Text("Open")
                            .font(.custom("TTTravelsTrl-Medium", size: 14))
                            .foregroundColor(.primaryTextColor)
                        Text("\(price.open.formattedNumber())")
                            .font(.custom("TTTravelsTrl-Medium", size: 16))
                            .foregroundColor(.primaryTextColor)
                    }
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 1, height: 30)
                    
                    VStack {
                        Text("Low")
                            .font(.custom("TTTravelsTrl-Medium", size: 14))
                            .foregroundColor(.primaryTextColor)
                        Text("\(price.low.formattedNumber())")
                            .font(.custom("TTTravelsTrl-Medium", size: 16))
                            .foregroundColor(.primaryTextColor)
                    }
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 1, height: 30)
                    
                    VStack {
                        Text("High")
                            .font(.custom("TTTravelsTrl-Medium", size: 14))
                            .foregroundColor(.primaryTextColor)
                        Text("\(price.high.formattedNumber())")
                            .font(.custom("TTTravelsTrl-Medium", size: 16))
                            .foregroundColor(.primaryTextColor)
                    }
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 1, height: 30)
                    
                    VStack {
                        Text("Vol")
                            .font(.custom("TTTravelsTrl-Medium", size: 14))
                            .foregroundColor(.primaryTextColor)
                        Text("\(price.volume.formattedToShortStyle())")
                            .font(.custom("TTTravelsTrl-Medium", size: 16))
                            .foregroundColor(.primaryTextColor)
                    }
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
                .offset(y: isViewVisible ? 0 : 150)
                .opacity(isViewVisible ? 1 : 0)
                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: SellStockView(stockItem: stockItem)
                        .navigationBarBackButtonHidden()
                        .environmentObject(stockService)
                        .environmentObject(portfolioRep)
                    ) {
                        Text("SELL")
                            .font(.custom("TTTravelsTrl-Bold", size: 19))
                            .foregroundColor(.primaryTextColor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 24, style: .continuous)
                                    .fill(
                                        LinearGradient(colors: [
                                            .red,
                                            Color.init(red: 1, green: 184/255, blue: 0)
                                        ], startPoint: .top, endPoint: .bottom)
                                    )
                            )
                            .offset(y: isViewVisible ? 0 : 150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isViewVisible)
                    }
                    
                    NavigationLink(destination: BuyStockView(stockItem: stockItem)
                        .navigationBarBackButtonHidden()
                        .environmentObject(stockService)
                        .environmentObject(portfolioRep)
                    ) {
                        Text("BUY")
                            .font(.custom("TTTravelsTrl-Bold", size: 19))
                            .foregroundColor(.primaryTextColor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 24, style: .continuous)
                                    .fill(
                                        LinearGradient(colors: [
                                            Color.init(red: 0, green: 1, blue: 10/255),
                                            Color.init(red: 0, green: 178/255, blue: 1)
                                        ], startPoint: .top, endPoint: .bottom)
                                    )
                            )
                            .offset(y: isViewVisible ? 0 : 150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(5)), value: isViewVisible)
                    }
                }
                .padding(.horizontal)
            }
            .background(
                Image("questions_background")
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .onAppear {
                isViewVisible = true
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    DetailsStockItemView(stockItem: StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")))
        .environmentObject(StockRepository())
        .environmentObject(PortfolioRepository())
}
