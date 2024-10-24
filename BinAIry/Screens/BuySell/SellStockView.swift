import SwiftUI

struct SellStockView: View {
    
    @Environment(\.presentationMode) var presMode
    var stockItem: StockItem
    @EnvironmentObject var stockService: StockRepository
    @EnvironmentObject var portfolioRep: PortfolioRepository
    @State private var isViewVisible: Bool = false
    @State private var sellSuccess: Bool = false
    
    @State var payAmount = ""
    @State var getUnitsAmount = ""
    
    var body: some View {
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
                
                Text("SELL \(stockItem.ticker)")
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
                VStack(alignment: .leading, spacing: 0) {
                    Text("You Sell")
                        .font(.custom("TTTravelsTrl-Medium", size: 20))
                        .foregroundColor(.primaryTextColor)
                        .padding(.leading)
                    
                    TextField("Units", text: $payAmount)
                        .font(.custom("TTTravelsTrl-Bold", size: 22))
                        .foregroundColor(payAmount.isEmpty ? .primaryTextColor : .secondaryTextColor)
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .onChange(of: payAmount) { newValue in
                            let payAmount = Double(newValue) ?? 0
                            let unitsQuantity = payAmount * price.preMarket
                            getUnitsAmount = "\(unitsQuantity.formattedNumber())"
                        }
                    
                    let assetItem = portfolioRep.portfolio.filter { $0.ticker == stockItem.ticker }
                    
                    if assetItem.isEmpty {
                        Text("Balance: 0")
                            .multilineTextAlignment(.leading)
                            .font(.custom("TTTravelsTrl-Medium", size: 14))
                            .foregroundColor(.secondaryTextColor)
                            .padding(.leading)
                    } else {
                        Text("Balance: \(assetItem[0].quantity)")
                            .multilineTextAlignment(.leading)
                            .font(.custom("TTTravelsTrl-Medium", size: 12))
                            .foregroundColor(.secondaryTextColor)
                            .padding(.leading)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 70)
                
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 1, height: 90)
                    
                    Image("swap_btn")
                        .resizable()
                        .frame(width: 42, height: 42)
                }
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Text("You Get")
                        .font(.custom("TTTravelsTrl-Medium", size: 20))
                        .foregroundColor(.primaryTextColor)
                        .multilineTextAlignment(.leading)
                    
                    Text(getUnitsAmount.isEmpty ? "Amount" : getUnitsAmount)
                        .font(.custom("TTTravelsTrl-Bold", size: 22))
                        .foregroundColor(getUnitsAmount.isEmpty ? .secondaryTextColor : .primaryTextColor)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity)
            }
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
            
            Button {
                let sellResult = portfolioRep.sell(ticker: stockItem.ticker, price: price.preMarket, quantity: Double(payAmount) ?? 0.0)
                sellSuccess = !sellResult
                if sellResult {
                    presMode.wrappedValue.dismiss()
                }
            } label: {
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
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
            }
            .padding(.top)
            .padding(.horizontal)
            .disabled(payAmount.isEmpty)
            .opacity(payAmount.isEmpty ? 0.6 : 1)
            
            Spacer()
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
        .alert(isPresented: $sellSuccess) {
            Alert(title: Text("Sell error!"), message: Text("You don't have enought stock units in the portfolio to sell! First you need to buy and then sell when you need."))
        }
    }
    
}

#Preview {
    SellStockView(stockItem: StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")))
        .environmentObject(StockRepository())
        .environmentObject(PortfolioRepository())
}
