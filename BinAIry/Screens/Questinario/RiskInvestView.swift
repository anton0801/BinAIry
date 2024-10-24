import SwiftUI

struct RiskInvestView: View {
    
    @Environment(\.presentationMode) var presMode
    @EnvironmentObject var questionsVm: QuestionsVm
    @EnvironmentObject var stocksService: StockRepository
    @State private var isViewVisible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("2/5")
                    .font(.custom("TTTravelsTrl-Medium", size: 24))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                Text("What is your\nrisk level?")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                if questionsVm.riskLevel == "aggressive" {
                    Text("aggressive")
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.init(red: 249/255, green: 254/255, blue: 196/255).opacity(0.2))
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Color.init(red: 249/255, green: 254/255, blue: 196/255), lineWidth: 3)
                        )
                        .padding(.horizontal)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                } else {
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            questionsVm.riskLevel = "aggressive"
                        }
                    } label: {
                        Text("aggressive")
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.init(red: 249/255, green: 254/255, blue: 196/255).opacity(0.2))
                            )
                    }
                    .padding(.horizontal)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                }
                
                if questionsVm.riskLevel == "moderate" {
                    Text("moderate")
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(Color.init(red: 159/255, green: 248/255, blue: 168/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.init(red: 159/255, green: 248/255, blue: 168/255).opacity(0.2))
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Color.init(red: 159/255, green: 248/255, blue: 168/255), lineWidth: 3)
                        )
                        .padding(.horizontal)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                } else {
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            questionsVm.riskLevel = "moderate"
                        }
                    } label: {
                        Text("moderate")
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(Color.init(red: 159/255, green: 248/255, blue: 168/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.init(red: 159/255, green: 248/255, blue: 168/255).opacity(0.2))
                            )
                    }
                    .padding(.horizontal)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                }
                
                if questionsVm.riskLevel == "conservative" {
                    Text("conservative")
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(Color.init(red: 50/255, green: 93/255, blue: 244/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.init(red: 50/255, green: 93/255, blue: 244/255).opacity(0.2))
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Color.init(red: 50/255, green: 93/255, blue: 244/255), lineWidth: 3)
                        )
                        .padding(.horizontal)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                } else {
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            questionsVm.riskLevel = "conservative"
                        }
                    } label: {
                        Text("conservative")
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(Color.init(red: 50/255, green: 93/255, blue: 244/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.init(red: 50/255, green: 93/255, blue: 244/255).opacity(0.2))
                            )
                    }
                    .padding(.horizontal)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        questionsVm.riskLevel = nil
                        presMode.wrappedValue.dismiss()
                    } label: {
                        Text("Back")
                            .font(.custom("TTTravelsTrl-Medium", size: 19))
                            .foregroundColor(.primaryTextColor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 24, style: .continuous)
                                    .fill(Color.secondaryButtonColor)
                            )
                    }
                    .offset(y: isViewVisible ? 0 : 350)
                    .opacity(isViewVisible ? 0.6 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                    
                    NavigationLink(destination: IndustriesInvestingView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(questionsVm)
                        .environmentObject(stocksService)) {
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
                            .offset(y: isViewVisible ? 0 : 350)
                            .opacity(isViewVisible ? 0.6 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                    }
                    .disabled(questionsVm.riskLevel == nil)
                    .opacity(questionsVm.riskLevel == nil ? 0.6 : 1)
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
    RiskInvestView()
        .environmentObject(StockRepository())
        .environmentObject(QuestionsVm())
}
