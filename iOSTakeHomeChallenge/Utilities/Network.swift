//
//  Network.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import Foundation


class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    let getHTTPMethod = HTTPMethod.get
    
    func request(additionalHeaderValues: [String: String] = [String: String](),
                 completion: @escaping(Result<[Character], NetworkingError>) -> Void) {
        
        let urlString = UtilitiesStrings.endPoint
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.unableToComplete))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = getHTTPMethod.rawValue
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.httpAdditionalHeaders = UtilitiesStrings.aditionalHeader
        
        let task = URLSession(configuration: config)
            .dataTask(with: request, completionHandler: { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([Character].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.invalidData))
                }
            }
        })
        task.resume()
    }
    
}

