import Combine
import Foundation

class PortfolioRepository: ObservableObject {
    
    @Published private(set) var portfolio: [PortfolioItem] = [] {
        didSet {
            savePortfolio()
        }
    }
    @Published private(set) var balance: Double = 0.0 {
        didSet {
            saveBalance()
        }
    }

    private let portfolioKey = "portfolioKey"
    private let balanceKey = "balanceKey"

    init() {
        loadPortfolio()
        loadBalance()
    }
    
    func buy(ticker: String, price: Double, quantity: Double) -> Bool {
        let totalPrice = price * quantity

        if let index = portfolio.firstIndex(where: { $0.ticker == ticker }) {
            portfolio[index].quantity += quantity
        } else {
            let newStock = PortfolioItem(ticker: ticker, quantity: quantity)
            portfolio.append(newStock)
        }
        
        updateBalance(with: Double(totalPrice))
        return true
    }

    func sell(ticker: String, price: Double, quantity: Double) -> Bool {
        if let index = portfolio.firstIndex(where: { $0.ticker == ticker }) {
            let currentQuantity = portfolio[index].quantity
            let totalPrice = price * Double(quantity)

            if currentQuantity >= quantity {
                portfolio[index].quantity -= quantity
                
                if portfolio[index].quantity == 0 {
                    portfolio.remove(at: index)
                }
                
                updateBalance(with: -totalPrice)
                return true
            } else {
                return false
            }
        }
        return false
    }

    private func updateBalance(with transactionAmount: Double) {
        balance += transactionAmount
    }

    private func savePortfolio() {
        if let encoded = try? JSONEncoder().encode(portfolio) {
            UserDefaults.standard.set(encoded, forKey: portfolioKey)
        }
    }

    private func loadPortfolio() {
        if let savedData = UserDefaults.standard.data(forKey: portfolioKey),
           let decoded = try? JSONDecoder().decode([PortfolioItem].self, from: savedData) {
            self.portfolio = decoded
        }
    }

    private func saveBalance() {
        UserDefaults.standard.set(balance, forKey: balanceKey)
    }

    private func loadBalance() {
        balance = UserDefaults.standard.double(forKey: balanceKey)
    }
    
}

