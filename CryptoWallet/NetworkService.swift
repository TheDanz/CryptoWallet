import Foundation

protocol URLRequestConvertible {
    func makeURLRequest() throws -> URLRequest
}

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
        
        guard let url = URL(string: APIConfig.baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        return request
    }
}

struct APIConfig {
    static let baseURL = "https://data.messari.io/api/v1"
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case invalidResponse
    case dataConversionFailure
}

protocol NetworkServiceProtocol {
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response
}


class BaseNetworkService<Router: URLRequestConvertible> {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    private func handleResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
        }
    }
    
    func request<T: Decodable>(_ returnType: T.Type, router: Router) async throws -> T {
        let request = try router.makeURLRequest()
        
        let (data, response) = try await urlSession.data(from: request.url!)
        try handleResponse(data: data, response: response)
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(returnType, from: data)
            return decodedData
        } catch {
            throw NetworkError.dataConversionFailure
        }
    }
}

class NetworkService: BaseNetworkService<CoinRouter>, NetworkServiceProtocol {
    
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response {
        return try await request(Response.self, router: .fetch(coinSymbol: coinSymbol.rawValue))
    }
}

protocol NetworkRepositoryProtocol {
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response
}

// MARK: - NetworkRepository

class NetworkRepository: NetworkRepositoryProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCoins(coinSymbol: Response.CoinSymbol) async throws -> Response {
        return try await networkService.fetchCoins(coinSymbol: coinSymbol)
    }
}
