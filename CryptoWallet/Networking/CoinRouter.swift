import Foundation

enum CoinRouter: URLRequestConvertible {
    case fetch(coinSymbol: String)
    
    var endpoint: String {
        switch self {
        case .fetch(let coinSymbool):
            return "/assets/\(coinSymbool)/metrics"
        }
    }
    
    var method: String {
        switch self {
        case .fetch:
            return "GET"
        }
    }
    
    func makeURLRequest() throws -> URLRequest {
        
        guard let url = URL(string: MessariAPI.baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        return request
    }
}
