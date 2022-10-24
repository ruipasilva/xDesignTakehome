//
//  Network.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import Foundation


class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    func request(additionalHeaderValues: [String: String] = [String: String](),
                 completion: @escaping(Result<[Character], NetworkingError>) -> Void) {
        
        guard let url = URL(string: "https://yj8ke8qonl.execute-api.eu-west-1.amazonaws.com/characters") else {
            completion(.failure(.unableToComplete))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.httpAdditionalHeaders = [
            "Authorization": "Bearer 754t!si@glcE2qmOFEcN"
        ]
        
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
