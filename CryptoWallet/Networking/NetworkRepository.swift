class NetworkRepository: NetworkRepositoryProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response {
        return try await networkService.fetchCoins(coinSymbol: coinSymbol)
    }
}
