import os
import Foundation

final class ViewModel {
    
    private(set) var coins = Array<Response.CoinData>()
    var onCoinsUpdated: (() -> Void)?
    
    init() { }
    
    func numberOfCoins() -> Int {
        coins.count
    }
    
    func coin(at index: Int) -> Response.CoinData {
        return coins[index]
    }
    
    func sortCoins(ascending: Bool = true) {
        coins.sort {
            ascending ? $0.marketData.percentChangeUsdLastHour > $1.marketData.percentChangeUsdLastHour : $0.marketData.percentChangeUsdLastHour < $1.marketData.percentChangeUsdLastHour
        }
        onCoinsUpdated?()
    }
    
    func fetchCoins() {
        
        coins.removeAll()
                
        let networkService = NetworkRepository(networkService: NetworkService())        
        let group = DispatchGroup()
        
        for symbol in Response.symbols {
            
            group.enter()
            Task {
                defer { group.leave() }
                
                do {
                    let response = try await networkService.fetchCoins(coinSymbol: symbol)
                    coins.append(response.data)
                } catch {
                    logger.info("Error fetching data for \(symbol.rawValue): \(error.localizedDescription)")
                }
            }
        }
        
        group.notify(queue: .main) {
            logger.info("All data fetched")
            self.onCoinsUpdated?()
        }
    }
}

private let logger = Logger()
