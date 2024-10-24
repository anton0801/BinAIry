import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stockRepository: StockRepository
    @StateObject var portfolioRep: PortfolioRepository = PortfolioRepository()
    
    @State var currentIndexPage = 0
    
    var body: some View {
        VStack(spacing: 0) {
            switch currentIndexPage {
            case 0:
                AIAdvisorView()
                    .environmentObject(stockRepository)
            case 1:
                PortfolioView()
                    .environmentObject(stockRepository)
                    .environmentObject(portfolioRep)
            case 2:
                MarketView()
                    .environmentObject(stockRepository)
                    .environmentObject(portfolioRep)
            case 3:
                ProfileView()
                    .environmentObject(stockRepository)
            default:
                EmptyView()
            }
            Spacer()
            CustomTabView(currentIndexPage: $currentIndexPage)
        }
        .background(
            Rectangle()
                .fill(Color.backgroundColor)
                .frame(minWidth: UIScreen.main.bounds.width,
                       minHeight: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct CustomTabView: View {
    
    @Binding var currentIndexPage: Int
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    currentIndexPage = 0
                }
            } label: {
                Image("nav_advisor")
                    .resizable()
                    .frame(width: 52, height: 50)
                    .opacity(currentIndexPage == 0 ? 1 : 0.7)
            }
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    currentIndexPage = 1
                }
            } label: {
                Image("nav_portfolio")
                    .resizable()
                    .frame(width: 52, height: 50)
                    .opacity(currentIndexPage == 1 ? 1 : 0.7)
            }
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    currentIndexPage = 2
                }
            } label: {
                Image("nav_market")
                    .resizable()
                    .frame(width: 52, height: 50)
                    .opacity(currentIndexPage == 2 ? 1 : 0.7)
            }
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    currentIndexPage = 3
                }
            } label: {
                Image("nav_profile")
                    .resizable()
                    .frame(width: 52, height: 50)
                    .opacity(currentIndexPage == 3 ? 1 : 0.7)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        Color.init(red: 68/255, green: 68/255, blue: 68/255),
                        Color.init(red: 81/255, green: 81/255, blue: 81/255).opacity(0.38),
                    ], startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                .cornerRadius(20, corners: [.topLeft, .topRight])
        )
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(LinearGradient(colors: [Color.strokeColor, Color.stroke2Color.opacity(0.38)], startPoint: .bottom, endPoint: .top), lineWidth: 3)
        )
    }
    
}

#Preview {
    ContentView()
        .environmentObject(StockRepository())
}
