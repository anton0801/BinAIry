import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var stockService: StockRepository
    @State private var isViewVisible: Bool = false
    
    @State var initialName = UserDefaults.standard.string(forKey: "user_name") ?? ""
    @State var nameInput = UserDefaults.standard.string(forKey: "user_name") ?? ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Profile")
                    .font(.custom("TTTravelsTrl-Bold", size: 42))
                    .foregroundColor(.primaryTextColor)
                    .offset(y: isViewVisible ? 0 : -150)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeOut(duration: 0.6).delay(0.1 * Double(1)), value: isViewVisible)
                    .padding(.horizontal)
                    .padding(.top, 32)
                
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
//                    .onChange(of: nameInput) { newValue in
//                        UserDefaults.standard.set(newValue, forKey: "user_name")
//                    }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("AI assistant")
                            .font(.custom("TTTravelsTrl-Bold", size: 24))
                            .foregroundColor(.primaryTextColor)
                            .offset(y: isViewVisible ? 0 : -150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                            .padding(.top, 32)
                        
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .offset(y: isViewVisible ? 0 : -150)
                            .opacity(isViewVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                    }
                    .padding(.horizontal)
                    
                    Text("You can change the parameters")
                        .font(.custom("TTTravelsTrl-Medium", size: 18))
                        .foregroundColor(.secondaryTextColor)
                        .offset(y: isViewVisible ? 0 : -150)
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(3)), value: isViewVisible)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 6)
                        .padding([.horizontal, .bottom])
                    
                    NavigationLink(destination: QuestionsNameView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(stockService)) {
                            Text("Change parameter")
                                .font(.custom("TTTravelsTrl-Medium", size: 18))
                                .foregroundColor(.primaryButtonColor)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                                        .fill(.white)
                                )
                                .padding([.horizontal, .bottom])
                                .offset(y: isViewVisible ? 0 : -150)
                                .opacity(isViewVisible ? 1 : 0)
                                .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isViewVisible)
                        }
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
                
                Spacer()
                
                Button {
                    UserDefaults.standard.set(nameInput, forKey: "user_name")
                    initialName = nameInput
                } label: {
                    Text("Save")
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
                        .opacity(isViewVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.1 * Double(4)), value: isViewVisible)
                }
                .disabled(initialName == nameInput)
                .opacity(initialName == nameInput ? 0.6 : 1)
                .animation(.easeOut(duration: 0.6), value: initialName == nameInput)
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
    ProfileView()
        .environmentObject(StockRepository())
}
