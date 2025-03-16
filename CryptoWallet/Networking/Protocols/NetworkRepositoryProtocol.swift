protocol NetworkRepositoryProtocol {
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response
}
