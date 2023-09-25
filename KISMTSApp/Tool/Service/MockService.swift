//
//  MockService.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/25.
//

import Foundation
import Alamofire

class MockService: ServiceType {
    func requestService<T>(
        url: URL,
        method: HTTPMethod,
        responseData: T.Type,
        headers: HTTPHeaders,
        params: [String : Any]
    ) async throws -> T where T : Decodable {
        
        var mockData: Data
        
        let mockJSONData = """
            {
                "id": 1,
                "name": "Mock Data"
            }
        """.data(using: .utf8)!
        
        if url == URLInfo.balance.url {
            mockData = try JSONSerialization.data(withJSONObject: Constants.Mock.ResponseData.balance.response)
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: mockData)
                return decodedData
            } catch {
                print(error)
                throw NetworkError.decodingError
            }
        } else {
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: mockJSONData)
                return decodedData
            } catch {
                print(error)
                throw NetworkError.decodingError
            }
        }
    }
}


