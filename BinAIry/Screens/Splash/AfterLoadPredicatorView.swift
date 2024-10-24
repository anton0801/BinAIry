import SwiftUI

struct AfterLoadPredicatorView: View {
    
    @EnvironmentObject var stocksService: StockRepository
    @State var onboardingPassed = false
    @State var advisorAiQuestionsPassed = false
    
    var body: some View {
        VStack {
            if !onboardingPassed {
                OnBoardingView()
                    .environmentObject(stocksService)
            } else {
                if !advisorAiQuestionsPassed {
                    QuestionsNameView()
                        .environmentObject(stocksService)
                } else {
                    ContentView()
                        .environmentObject(stocksService)
                }
            }
        }
        .onAppear {
            onboardingPassed = UserDefaults.standard.bool(forKey: "is_onboarding_passed")
            advisorAiQuestionsPassed = UserDefaults.standard.bool(forKey: "is_advisorAiQuestionsPassed")
        }
    }
}

#Preview {
    AfterLoadPredicatorView()
        .environmentObject(StockRepository())
}
