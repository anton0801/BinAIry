import SwiftUI

struct QuestionsNameView: View {
    
    @StateObject var questionsVm: QuestionsVm = QuestionsVm()
    @EnvironmentObject var stocksService: StockRepository
    @State private var isViewVisible: Bool = false
    
    @State var nameInput = UserDefaults.standard.string(forKey: "user_name") ?? ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("What is your\nname?")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                
                TextField("Name", text: $nameInput)
                    .font(.custom("TTTravelsTrl-Medium", size: 24))
                    .foregroundColor(.primaryTextColor)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.inputBackground)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
                    .offset(y: isViewVisible ? 0 : -250)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(2)), value: isViewVisible)
                    .padding(.horizontal)
                    .onChange(of: nameInput) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "user_name")
                    }
                
                Spacer()
                
                NavigationLink(destination: TimeInvestmentsView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(questionsVm)
                    .environmentObject(stocksService)) {
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
                        .padding(.horizontal)
                        .offset(y: isViewVisible ? 0 : 350)
                        .opacity(isViewVisible ? 0.6 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                }
                    .disabled(nameInput.isEmpty)
                    .opacity(nameInput.isEmpty ? 0.6 : 1)
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
    QuestionsNameView()
        .environmentObject(StockRepository())
}
