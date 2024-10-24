import SwiftUI

struct DividentsView: View {
    
    @Environment(\.presentationMode) var presMode
    @EnvironmentObject var questionsVm: QuestionsVm
    @EnvironmentObject var stocksService: StockRepository
    @State private var isViewVisible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("4/5")
                    .font(.custom("TTTravelsTrl-Medium", size: 24))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                Text("How do you feel\nabout\ndividends?")
                    .font(.custom("TTTravelsTrl-Bold", size: 40))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                if questionsVm.dividents == "I prefer companies that pay dividends" {
                    Text("I prefer companies that pay dividends")
                        .multilineTextAlignment(.leading)
                        .font(.custom("TTTravelsTrl-Bold", size: 24))
                        .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
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
                            questionsVm.dividents = "I prefer companies that pay dividends"
                        }
                    } label: {
                        Text("I prefer companies that pay dividends")
                            .multilineTextAlignment(.leading)
                            .font(.custom("TTTravelsTrl-Bold", size: 20))
                            .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
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
                
                if questionsVm.dividents == "I don't attach any importance to this" {
                    Text("I don't attach any importance to this")
                        .multilineTextAlignment(.leading)
                        .font(.custom("TTTravelsTrl-Bold", size: 20))
                        .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
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
                            questionsVm.dividents = "I don't attach any importance to this"
                        }
                    } label: {
                        Text("I don't attach any importance to this")
                            .multilineTextAlignment(.leading)
                            .font(.custom("TTTravelsTrl-Bold", size: 20))
                            .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
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
                
                if questionsVm.dividents == "I prefer to reinvest profits in the development" {
                    Text("I prefer to reinvest profits in the development")
                        .multilineTextAlignment(.leading)
                        .font(.custom("TTTravelsTrl-Bold", size: 20))
                        .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
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
                            questionsVm.dividents = "I prefer to reinvest profits in the development"
                        }
                    } label: {
                        Text("I prefer to reinvest profits in the development")
                            .multilineTextAlignment(.leading)
                            .font(.custom("TTTravelsTrl-Bold", size: 20))
                            .foregroundColor(Color.init(red: 249/255, green: 254/255, blue: 196/255))
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
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
                
                Spacer()
                
                HStack {
                    Button {
                        questionsVm.dividents = nil
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
                    
                    NavigationLink(destination: HowMuchView()
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
                    .disabled(questionsVm.dividents == nil)
                    .opacity(questionsVm.dividents == nil ? 0.6 : 1)
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
    DividentsView()
        .environmentObject(StockRepository())
        .environmentObject(QuestionsVm())
}
