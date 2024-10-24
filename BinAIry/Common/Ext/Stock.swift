import Foundation

extension StockItem {
    static let placeholder = StockItem(
        ticker: "STOCK",
        name: "STOCK Company",
        market: "STOCK Market",
        marketCap: 0.0,
        branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "")
    )
}

extension OpenCloseResponse {
    static let placeholder = OpenCloseResponse(
        symbol: "STOCK",
        open: 0.0,
        high: 0.0,
        low: 0.0,
        volume: 0,
        preMarket: 0.0
    )
}
