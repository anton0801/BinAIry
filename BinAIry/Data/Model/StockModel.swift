import Foundation

struct StockItem: Codable {
    let ticker: String
    let name: String
    let market: String
    let marketCap: Double
    let branding: BrandingStock
    
    private enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case market
        case marketCap = "market_cap"
        case branding
    }
    
    struct BrandingStock: Codable {
        let logoUrl: String
        let iconUrl: String
        
        private enum CodingKeys: String, CodingKey {
            case logoUrl = "logo_url"
            case iconUrl = "icon_url"
        }
    }
}

struct OpenCloseResponse: Codable {
    let symbol: String
    let open: Double
    let high: Double
    let low: Double
    let volume: Int
    let preMarket: Double
    
    var changeInPercents: Double {
        guard preMarket != 0 else { return 0 }
        return ((open - preMarket) / preMarket) * 100
    }
}

struct StockDetailsResponse: Codable {
    let results: StockItem
}

extension StockDetailsResponse {
    static let empty = StockDetailsResponse(results: StockItem.placeholder)
}
