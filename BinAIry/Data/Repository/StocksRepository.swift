import Foundation
import Combine
import Alamofire

class StockRepository: ObservableObject {
    
    private var cancellableSet = Set<AnyCancellable>()
    
    @Published var stockItems: [StockItem] = [
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg")),
        StockItem(ticker: "AAPL", name: "Apple Inc.", market: "Stocks", marketCap: 3_000_000_000_000, branding: StockItem.BrandingStock(logoUrl: "", iconUrl: "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8ed3d547-94ff-48e1-9f20-8c14a7030a02_2000x2000.jpeg"))
    ]
    @Published var stockPrices: [OpenCloseResponse] = [
        OpenCloseResponse(symbol: "AAPL", open: 124.23, high: 124.52, low: 123.26, volume: 1_000_000_000, preMarket: 124.52)
    ]
    @Published var isLoading: Bool = true
    
    private let tickerList: [String] = [
        "MSFT", "UPS", "AAA", "ABT", "IBM", "ACN", "ADDYY", "AIG", "ALLE", "AMZN", "AAL", "ARMK",
        "T", "TJX", "TM", "TRIP", "TSLA", "AAPL", "BEST", "UPS", "V", "VLO", "VZ",
        "CNC", "CVS", "DARDEN", "LMT", "DAL", "F", "GM", "GDDY", "GME", "GOOG", "GRUB",
        "BBY", "LOW", "LYFT", "MMM", "MCD", "META", "MAR", "NKE", "NFLX", "NOC", "ORCL",
        "UNP", "WMT", "XOM", "YUM",
        "PEP", "PG", "POST", "PM", "PSTG", "PXD", "RCL", "RTX", "RIVN", "SPG",
        "HES", "HBI", "HCA", "HD", "HRB", "HON", "JCI", "JPM", "JNJ", "K", "KSS", "KR", "LKQ",
    ]

    func loadStockData() {
        isLoading = true
        stockItems = []
        stockPrices = []
        let tickerBatches = divideTickersIntoBatches(tickerList, size: 20)
        
        let detailsPublishers = tickerBatches.map(fetchDetailsForBatch)
        let pricePublishers = tickerBatches.map(fetchPricesForBatch)
        
        processPublishers(publishers: detailsPublishers) { [weak self] items in
            self?.stockItems = items.map { $0.results }
        }
        
        processPublishers(publishers: pricePublishers) { [weak self] prices in
            self?.stockPrices = prices
            self?.isLoading = false
            var temp: [StockItem] = []
            for stock in self?.stockItems ?? [] {
                if stock.name != "STOCK Company" {
                    temp.append(stock)
                }
            }
            self?.stockItems = temp
        }
    }
    
    private func processPublishers<T>(publishers: [AnyPublisher<[T], Never>], completion: @escaping ([T]) -> Void) {
        Publishers.MergeMany(publishers)
            .collect()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { result in
                let mergedResult = result.flatMap { $0 }
                completion(mergedResult)
            })
            .store(in: &cancellableSet)
    }
    
    private func divideTickersIntoBatches(_ tickers: [String], size: Int) -> [[String]] {
        stride(from: 0, to: tickers.count, by: size).map { Array(tickers[$0..<min($0 + size, tickers.count)]) }
    }
    
    private func fetchDetailsForBatch(tickers: [String]) -> AnyPublisher<[StockDetailsResponse], Never> {
        let publishers = tickers.map(fetchStockDetail)
        return combinePublishers(publishers)
    }
    
    private func fetchPricesForBatch(tickers: [String]) -> AnyPublisher<[OpenCloseResponse], Never> {
        let publishers = tickers.map(fetchStockPrice)
        return combinePublishers(publishers)
    }
    
    private func fetchStockDetail(ticker: String) -> AnyPublisher<StockDetailsResponse, Never> {
        guard let url = URL(string: "\(APIConfig.baseUrl)v3/reference/tickers/\(ticker)?apiKey=\(APIConfig.apiKey)") else {
            return Just(StockDetailsResponse.empty).eraseToAnyPublisher()
        }

        return fetchData(url: url, defaultValue: StockDetailsResponse.empty)
    }
    
    private func fetchStockPrice(ticker: String) -> AnyPublisher<OpenCloseResponse, Never> {
        let dateString = formattedDateForPreviousDay()
        let url = buildURL(for: "v1/open-close/\(ticker)/\(dateString)", apiKey: APIConfig.apiKey)
        return fetchData(url: url, defaultValue: OpenCloseResponse(
            symbol: ticker,
            open: 0.0,
            high: 0.0,
            low: 0.0,
            volume: 0,
            preMarket: 0.0
        ))
    }
    
    private func buildURL(for path: String, apiKey: String) -> URL? {
        URL(string: "\(APIConfig.baseUrl)\(path)?apiKey=\(apiKey)")
    }
    
    private func fetchData<T: Decodable>(url: URL?, defaultValue: T) -> AnyPublisher<T, Never> {
        guard let url = url else {
            return Just(defaultValue).eraseToAnyPublisher()
        }
        
        return Future<T, Never> { promise in
            AF.request(url)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure:
                        promise(.success(defaultValue))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
    
    private func combinePublishers<T>(_ publishers: [AnyPublisher<T, Never>]) -> AnyPublisher<[T], Never> {
        Publishers.MergeMany(publishers)
            .collect()
            .eraseToAnyPublisher()
    }
    
    private func formattedDateForPreviousDay() -> String {
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())
        return DateFormatter.yyyyMMdd.string(from: yesterday ?? Date())
    }
}
