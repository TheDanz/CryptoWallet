protocol NetworkServiceProtocol {
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response
}
