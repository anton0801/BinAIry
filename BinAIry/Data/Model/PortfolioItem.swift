import Foundation

struct PortfolioItem: Codable, Identifiable {
    let id = UUID().uuidString
    let ticker: String
    var quantity: Double
}
