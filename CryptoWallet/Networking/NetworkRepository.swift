class NetworkRepository: NetworkRepositoryProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCoins(coinSymbol: Response.CoinType) async throws -> Response {
        return try await networkService.fetchCoins(coinSymbol: coinSymbol)
    }
}
