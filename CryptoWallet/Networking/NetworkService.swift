class NetworkService: BaseNetworkService<CoinRouter>, NetworkServiceProtocol {
    
    func fetchCoins(coinSymbol: Response.CoinType) async throws -> Response {
        return try await request(Response.self, router: .fetch(coinSymbol: coinSymbol.rawValue))
    }
}
