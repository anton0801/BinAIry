import SwiftUI

struct OnBoardingItem {
    var title: String
    var text: String
}

struct OnBoardingView: View {
    
    @EnvironmentObject var stocksService: StockRepository
    @State private var isViewVisible: Bool = false
    
    @State var currentOnBoardingIndex = 0 {
        didSet {
            currentOnBoardingItem = onboardingData[currentOnBoardingIndex]
        }
    }
    @State var currentOnBoardingItem: OnBoardingItem? = nil {
        didSet {
            isViewVisible = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                isViewVisible = true
            }
        }
    }
    var onboardingData: [Int: OnBoardingItem] = [
        0: OnBoardingItem(title: "AI will help you trade\nstocks", text: "Follow the news and analytics to keep up to date with the latest market trends."),
        1: OnBoardingItem(title: "Discover the world of\nstock trading", text: "Use artificial intelligence to automatically analyze and recommend trades."),
        2: OnBoardingItem(title: "Stock trading has\nbecome easier", text: "Do not forget about the risks associated with trading stocks. Always do your own analysis")
    ]
    
    @State var goToAdvisor = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(0)), value: isViewVisible)
                    .padding(.top, 42)
                
                Image("binAIry")
                    .resizable()
                    .frame(width: 150, height: 40)
                    .padding(.top, 16)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    if let onboardingItem = currentOnBoardingItem {
                        Text(onboardingItem.title)
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(.primaryTextColor)
                            .offset(y: isViewVisible ? 0 : 350)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                        
                        Text(onboardingItem.text)
                            .font(.custom("TTTravelsTrl-Medium", size: 19))
                            .foregroundColor(.secondaryTextColor)
                            .offset(y: isViewVisible ? 0 : 350)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                            .padding(.top, 4)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { index in
                                Button {
                                    currentOnBoardingIndex = index
                                } label: {
                                    if index == currentOnBoardingIndex {
                                        Image("page_indicator_active")
                                            .resizable()
                                            .frame(width: 24, height: 8)
                                    } else {
                                        Image("page_indicator_inactive")
                                            .resizable()
                                            .frame(width: 24, height: 7)
                                    }
                                }
                            }
                        }
                        .padding(.top, 16)
                        .offset(y: isViewVisible ? 0 : 350)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                        
                        HStack {
                            if currentOnBoardingIndex == 2 {
                                Button {
                                    UserDefaults.standard.set(true, forKey: "is_onboarding_passed")
                                    goToAdvisor = true
                                } label: {
                                    Text("Continue")
                                        .font(.custom("TTTravelsTrl-Medium", size: 19))
                                        .foregroundColor(.primaryTextColor)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                                .fill(
                                                    LinearGradient(colors: [
                                                        .primaryButtonColor,
                                                        .primary2ButtonColor
                                                    ], startPoint: .top, endPoint: .bottom)
                                                )
                                        )
                                }
                                .offset(y: isViewVisible ? 0 : 250)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                            } else {
                                Button {
                                    UserDefaults.standard.set(true, forKey: "is_onboarding_passed")
                                    goToAdvisor = true
                                } label: {
                                    Text("Skip")
                                        .font(.custom("TTTravelsTrl-Medium", size: 19))
                                        .foregroundColor(.primaryTextColor)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                                .fill(Color.secondaryButtonColor)
                                        )
                                }
                                .offset(y: isViewVisible ? 0 : 250)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                                
                                Button {
                                    currentOnBoardingIndex += 1
                                } label: {
                                    Text("Next")
                                        .font(.custom("TTTravelsTrl-Medium", size: 19))
                                        .foregroundColor(.primaryTextColor)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                                .fill(
                                                    LinearGradient(colors: [
                                                        .primaryButtonColor,
                                                        .primary2ButtonColor
                                                    ], startPoint: .top, endPoint: .bottom)
                                                )
                                        )
                                }
                                .offset(y: isViewVisible ? 0 : 150)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                            }
                        }
                        .padding(.top, 16)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                .background(Color.secondaryBackgroundColor)
                .clipShape(RoundedCorner(radius: 25, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
                
                NavigationLink(destination: QuestionsNameView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(stocksService), isActive: $goToAdvisor) {
                        
                    }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(
                Rectangle()
                    .fill(Color.backgroundColor)
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .onAppear {
                isViewVisible = true
                currentOnBoardingIndex = 0
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    OnBoardingView()
        .environmentObject(StockRepository())
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 25.0
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
