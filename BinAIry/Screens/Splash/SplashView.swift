import SwiftUI

struct SplashView: View {
    
    @State var animatingTitle: Bool = false
    @StateObject var stockService = StockRepository()
    @State var loadedData = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.animatingTitle = true
                            }
                        }
                    }
                
                if animatingTitle {
                    Image("binAIry")
                        .resizable()
                        .frame(width: 150, height: 40)
                        .padding(.top, 16)
                }
                
                if !stockService.isLoading {
                    Text("")
                        .onAppear {
                            self.loadedData = true
                        }
                }
                
                NavigationLink(destination: AfterLoadPredicatorView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(stockService), isActive: $loadedData) {
                    
                }
            }
            .background(
                Rectangle()
                    .fill(Color.backgroundColor)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .onAppear {
                stockService.loadStockData()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    SplashView()
}
