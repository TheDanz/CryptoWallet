protocol NetworkServiceProtocol {
    func fetchCoins(coinSymbol: Response.CoinType) async throws -> Response
}
