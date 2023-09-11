//
//  Service.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol ServiceType {
    func requestService<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        params: [String: String]?,
        responseData: T.Type
    ) async throws -> T
}

class Service: ServiceType {
    func requestService<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        params: [String: String]?,
        responseData: T.Type
    ) async throws -> T {
        do {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            if let params = params {
                request.httpBody = try JSONSerialization.data(withJSONObject: params)
            }
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print(data)
            print(response)
            
            guard let responseData = try? JSONDecoder().decode(responseData.self, from: data) else { throw NetworkError.decodingError }
            
            return responseData
            
        } catch {
            throw NetworkError.requestError
        }
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case update = "UPDATE"
    case delete = "DELETE"
}


enum NetworkError: Error {
    case requestError
    case responseError
    case decodingError
}
