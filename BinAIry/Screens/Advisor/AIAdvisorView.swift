import SwiftUI

struct AIAdvisorView: View {
    
    @State var isFirstViewsVisible = false
    @State var isSecondViewsVisible = false
    
    @State private var percentages: [Double] = [0.7, 0.2, 0.1]
    @State private var animationProgress: CGFloat = 0.0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                Text("AI Advisor")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isFirstViewsVisible ? 0 : -150)
                    .opacity(isFirstViewsVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isFirstViewsVisible)
                    .padding(.horizontal)
                    .padding(.top, 32)
                
                Text("advice from")
                    .font(.custom("TTTravelsTrl-Medium", size: 20))
                    .foregroundColor(.secondaryTextColor)
                    .offset(y: isFirstViewsVisible ? 0 : -150)
                    .opacity(isFirstViewsVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isFirstViewsVisible)
                    .padding(.top, 12)
                
                Image("binairy_advice")
                    .resizable()
                    .frame(width: 170, height: 70)
                    .offset(y: isFirstViewsVisible ? 0 : -150)
                    .opacity(isFirstViewsVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isFirstViewsVisible)
                    .padding(.top, 8)
                
                ZStack {
                    PieSegment(startAngle: .degrees(-90), endAngle: .degrees(-90 + 360 * percentages[0] * Double(animationProgress)), color: Color.init(red: 50/255, green: 244/255, blue: 232/255))
                        .shadow(color: Color.init(red: 0, green: 1, blue: 239/255).opacity(0.45), radius: 8)
                    
                    PieSegment(startAngle: .degrees(-90 + 360 * percentages[0]), endAngle: .degrees(-90 + 360 * (percentages[0] + percentages[1]) * Double(animationProgress)), color: Color.init(red: 228/255, green: 244/255, blue: 50/255))
                        .shadow(color: Color.init(red: 235/255, green: 1, blue: 0).opacity(0.45), radius: 8)
                    
                    PieSegment(startAngle: .degrees(-90 + 360 * (percentages[0] + percentages[1])), endAngle: .degrees(-90 + 360 * (percentages[0] + percentages[1] + percentages[2]) * Double(animationProgress)), color: Color.init(red: 248/255, green: 159/255, blue: 244/255))
                        .shadow(color: Color.init(red: 1, green: 0, blue: 245/255).opacity(0.45), radius: 8)
                }
                .rotationEffect(.degrees(-90))
                .padding(.top, 42)
                .frame(width: 250, height: 250)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        self.animationProgress = 1.0
                    }
                }
                
                HStack {
                    Circle()
                        .fill(Color.init(red: 248/255, green: 159/255, blue: 244/255))
                        .shadow(color: Color.init(red: 1, green: 0, blue: 245/255).opacity(0.45), radius: 8)
                        .frame(width: 32, height: 32)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isFirstViewsVisible)
                        .padding(.leading, 12)
                    
                    Text("Liquid stocks")
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isFirstViewsVisible)
                    
                    Spacer()
                    
                    Text("\(String(format: "%.0f", percentages[2] * 100))%")
                        .font(.custom("TTTravelsTrl-Bold", size: 20))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isFirstViewsVisible)
                }
                .padding(.top, 62)
                .padding(.horizontal)
                
                HStack {
                    Circle()
                        .fill(Color.init(red: 50/255, green: 244/255, blue: 232/255))
                        .shadow(color: Color.init(red: 0, green: 1, blue: 239/255).opacity(0.45), radius: 8)
                        .frame(width: 32, height: 32)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(5)), value: isFirstViewsVisible)
                        .padding(.leading, 12)
                    
                    Text("Crypto")
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(5)), value: isFirstViewsVisible)
                    
                    Spacer()
                    
                    Text("\(String(format: "%.0f", percentages[0] * 100))%")
                        .font(.custom("TTTravelsTrl-Bold", size: 20))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(5)), value: isFirstViewsVisible)
                }
                .padding(.top, 24)
                .padding(.horizontal)
                
                HStack {
                    Circle()
                        .fill(Color.init(red: 228/255, green: 244/255, blue: 50/255))
                        .shadow(color: Color.init(red: 235/255, green: 1, blue: 0).opacity(0.45), radius: 8)
                        .frame(width: 32, height: 32)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(6)), value: isFirstViewsVisible)
                        .padding(.leading, 12)
                    
                    Text("Bonds")
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(6)), value: isFirstViewsVisible)
                    
                    Spacer()
                    
                    Text("\(String(format: "%.0f", percentages[1] * 100))%")
                        .font(.custom("TTTravelsTrl-Bold", size: 20))
                        .foregroundColor(.primaryTextColor)
                        .offset(y: isFirstViewsVisible ? 0 : -150)
                        .opacity(isFirstViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(6)), value: isFirstViewsVisible)
                }
                .padding(.top, 24)
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Text("3 insights on stock\ntrading from AI")
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(.primaryTextColor)
                            .offset(y: isFirstViewsVisible ? 0 : -150)
                            .opacity(isFirstViewsVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(7)), value: isFirstViewsVisible)
                            .padding(.top, 32)
                        
                        Spacer()
                        
                        Image("logo_white")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .offset(y: isFirstViewsVisible ? 0 : -150)
                            .opacity(isFirstViewsVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(7)), value: isFirstViewsVisible)
                    }
                    .padding(.horizontal)
                    
                    Text("""
– Stock trading requires a deep understanding of the market and the ability to analyze the financial performance of companies.
– Successful stock trading involves developing your own strategy based on your experience and preferences.
– Trading stocks is always a risk, so it's important to diversify your portfolio and not invest more than you're willing to lose.
""")
                    .font(.custom("TTTravelsTrl-Medium", size: 18))
                    .foregroundColor(.secondaryTextColor)
                    .offset(y: isFirstViewsVisible ? 0 : -150)
                    .opacity(isFirstViewsVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(7)), value: isFirstViewsVisible)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                    .lineSpacing(12)
                    .padding([.horizontal, .bottom])
                }
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(
                            LinearGradient(colors: [
                                Color.init(red: 0, green: 97/255, blue: 1),
                                Color.init(red: 97/255, green: 0, blue: 1)
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                )
                .padding(.top, 42)
                .padding(.horizontal)
                
                VStack {
                    Image("investor_index")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .offset(y: isSecondViewsVisible ? 0 : -150)
                        .opacity(isSecondViewsVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isSecondViewsVisible)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(
                            LinearGradient(colors: [
                                Color.init(red: 0, green: 97/255, blue: 1).opacity(0.1),
                                Color.init(red: 97/255, green: 0, blue: 1).opacity(0.1)
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                        )
                )
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(
                            LinearGradient(colors: [
                                Color.init(red: 0, green: 97/255, blue: 1),
                                Color.init(red: 97/255, green: 0, blue: 1)
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                )
                .padding(.top, 42)
                .padding(.horizontal)
                .onAppear {
                    self.isSecondViewsVisible = true
                }
            }
        }
        .background(
            Image("questions_background")
                .resizable()
                .frame(minWidth: UIScreen.main.bounds.width,
                       minHeight: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
        .onAppear {
            isFirstViewsVisible = true
            generateFirstData()
        }
    }
    
    private func generateFirstData() {
        var stocksLiquidPercent: Double = UserDefaults.standard.double(forKey: "stocks_liquid")
        var cryptoPercent: Double = UserDefaults.standard.double(forKey: "crypto_percent")
        var bondsPercent: Double = UserDefaults.standard.double(forKey: "bonds_percent")
        if stocksLiquidPercent == 0 && cryptoPercent == 0 && bondsPercent == 0 {
            stocksLiquidPercent = Double.random(in: 0.2...0.7)
            cryptoPercent = Double.random(in: 0.1...(1 - stocksLiquidPercent))
            bondsPercent = 1 - stocksLiquidPercent - cryptoPercent
            UserDefaults.standard.set(stocksLiquidPercent, forKey: "stocks_liquid")
            UserDefaults.standard.set(cryptoPercent, forKey: "crypto_percent")
            UserDefaults.standard.set(bondsPercent, forKey: "bonds_percent")
        }
        percentages = [cryptoPercent, bondsPercent, stocksLiquidPercent]
    }
    
}

struct PieSegment: View {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(endAngle.degrees - startAngle.degrees) / 360)
            .stroke(color, lineWidth: 50)
            .rotationEffect(startAngle)
    }
}

#Preview {
    AIAdvisorView()
}
