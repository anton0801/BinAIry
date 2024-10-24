import Foundation

class QuestionsVm: ObservableObject {
    
    @Published var howLongInvest: String? = nil
    @Published var riskLevel: String? = nil
    @Published var industries: String? = nil
    @Published var dividents: String? = nil
    @Published var howMuchInvestments: String? = nil {
        didSet {
            saveAllData()
        }
    }
    
    func saveAllData() {
        UserDefaults.standard.set(howLongInvest, forKey: "howLongInvest")
        UserDefaults.standard.set(riskLevel, forKey: "riskLevel")
        UserDefaults.standard.set(industries, forKey: "industries")
        UserDefaults.standard.set(dividents, forKey: "dividents")
        UserDefaults.standard.set(howMuchInvestments, forKey: "howMuchInvestments")
        
        UserDefaults.standard.set(0.0, forKey: "stocks_liquid")
        UserDefaults.standard.set(0.0, forKey: "crypto_percent")
        UserDefaults.standard.set(0.0, forKey: "bonds_percent")
        UserDefaults.standard.set(true, forKey: "is_advisorAiQuestionsPassed")
    }
    
}
