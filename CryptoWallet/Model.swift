struct Response: Codable {
    
    let data: CoinData
    
    struct CoinData: Codable {
        let symbol: String
        let name: String
        let marketData: MarketData
        let marketCap: MarketCapitalization
        let supply: Supply
        
        private enum CodingKeys: String, CodingKey {
            case symbol
            case name
            case marketData = "market_data"
            case marketCap = "marketcap"
            case supply
        }
    }
    
    struct MarketData: Codable {
        let priceUSD: Double
        let percentChangeUsdLastHour: Double
        
        private enum CodingKeys: String, CodingKey {
            case priceUSD = "price_usd"
            case percentChangeUsdLastHour = "percent_change_usd_last_1_hour"
        }
    }
    
    struct MarketCapitalization: Codable {
        let capitalizationUSD: Double

        private enum CodingKeys: String, CodingKey {
            case capitalizationUSD = "current_marketcap_usd"
        }
    }
    
    struct Supply: Codable {
        let circulating: Double
    }
    
    enum CoinSymbol: String {
        case btc
        case eth
        case tron
        case luna
        case polkadot
        case dogecoin
        case tether
        case stellar
        case cardano
        case xrp
    }
    
    static let symbols: [CoinSymbol] = [.btc, .eth, .tron, .luna, .polkadot, .dogecoin, .tether, .stellar, .cardano, .xrp]
}
