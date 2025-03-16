protocol NetworkRepositoryProtocol {
    func fetchCoins(coinSymbol: Response.CoinType) async throws -> Response
}
