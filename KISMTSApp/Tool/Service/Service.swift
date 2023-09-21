//
//  Service.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation
import Alamofire

protocol ServiceType {
    func requestService<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        responseData: T.Type,
        headers: HTTPHeaders,
        params: [String: Any]
    ) async throws -> T
}

class Service: ServiceType {

}

extension ServiceType {
    func requestService<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        responseData: T.Type,
        headers: HTTPHeaders = [:],
        params: [String: Any] = [:]
    ) async throws -> T {
        let dataRequest = AF.request(
            url,
            method: method,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: headers
        )

        let dataTask = dataRequest.serializingDecodable(responseData)

        switch await dataTask.result {
        case .success(let value):
            print(value)
            return value
        case .failure(let error):
            print(error)
            print("Service Error: \(error.localizedDescription)")
            throw NetworkError.responseError
        }
    }
}

enum NetworkError: Error {
    case requestError
    case responseError
    case decodingError
}
