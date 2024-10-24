import SwiftUI

struct TimeInvestmentsView: View {
    
    @Environment(\.presentationMode) var presMode
    @EnvironmentObject var questionsVm: QuestionsVm
    @EnvironmentObject var stocksService: StockRepository
    @State private var isViewVisible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("1/5")
                    .font(.custom("TTTravelsTrl-Medium", size: 24))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                Text("How long do you\nplan to invest?")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                HStack {
                    if questionsVm.howLongInvest == "short-term" {
                        Text("short-term")
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(Color.init(red: 198/255, green: 244/255, blue: 50/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 140)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.init(red: 198/255, green: 244/255, blue: 50/255).opacity(0.2))
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(Color.init(red: 198/255, green: 244/255, blue: 50/255), lineWidth: 3)
                            )
                            .offset(y: isViewVisible ? 0 : -150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    } else {
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                questionsVm.howLongInvest = "short-term"
                            }
                        } label: {
                            Text("short-term")
                                .font(.custom("TTTravelsTrl-Bold", size: 24))
                                .foregroundColor(Color.init(red: 198/255, green: 244/255, blue: 50/255))
                                .frame(maxWidth: .infinity)
                                .frame(height: 140)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.init(red: 198/255, green: 244/255, blue: 50/255).opacity(0.2))
                                )
                        }
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    }
                    
                    VStack(spacing: 14) {
                        if questionsVm.howLongInvest == "medium-term" {
                            Text("medium-term")
                                .font(.custom("TTTravelsTrl-Bold", size: 24))
                                .foregroundColor(Color.init(red: 192/255, green: 159/255, blue: 248/255))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.init(red: 192/255, green: 159/255, blue: 248/255).opacity(0.2))
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(Color.init(red: 192/255, green: 159/255, blue: 248/255), lineWidth: 3)
                                )
                                .offset(y: isViewVisible ? 0 : -150)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                        } else {
                            Button {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    questionsVm.howLongInvest = "medium-term"
                                }
                            } label: {
                                Text("medium-term")
                                    .font(.custom("TTTravelsTrl-Bold", size: 24))
                                    .foregroundColor(Color.init(red: 192/255, green: 159/255, blue: 248/255))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .fill(Color.init(red: 192/255, green: 159/255, blue: 248/255).opacity(0.2))
                                    )
                            }
                            .offset(y: isViewVisible ? 0 : -150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                        }
                        
                        if questionsVm.howLongInvest == "long-term" {
                            Text("long-term")
                                .font(.custom("TTTravelsTrl-Bold", size: 24))
                                .foregroundColor(Color.init(red: 254/255, green: 196/255, blue: 221/255))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.init(red: 254/255, green: 196/255, blue: 221/255).opacity(0.2))
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(Color.init(red: 254/255, green: 196/255, blue: 221/255), lineWidth: 3)
                                )
                                .offset(y: isViewVisible ? 0 : -150)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                        } else {
                            Button {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    questionsVm.howLongInvest = "long-term"
                                }
                            } label: {
                                Text("long-term")
                                    .font(.custom("TTTravelsTrl-Bold", size: 24))
                                    .foregroundColor(Color.init(red: 254/255, green: 196/255, blue: 221/255))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .fill(Color.init(red: 254/255, green: 196/255, blue: 221/255).opacity(0.2))
                                    )
                            }
                            .offset(y: isViewVisible ? 0 : -150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding([.top, .horizontal])
                
                Spacer()
                
                HStack {
                    Button {
                        questionsVm.howLongInvest = nil
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
                    
                    NavigationLink(destination: RiskInvestView()
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
                    .disabled(questionsVm.howLongInvest == nil)
                    .opacity(questionsVm.howLongInvest == nil ? 0.6 : 1)
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
    TimeInvestmentsView()
        .environmentObject(StockRepository())
        .environmentObject(QuestionsVm())
}
