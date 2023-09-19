//
//  Repository.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol RepositoryType {
    func requestToken(appKey: String, appSecret: String) async throws -> AccessTokenModel
    
    
}

class Repository: RepositoryType {
    private var service: ServiceType
    
    init(service: ServiceType) {
        self.service = service
    }
    
    func requestToken(appKey: String, appSecret: String) async throws -> AccessTokenModel {
        let url = URL(string: "https://openapi.koreainvestment.com:9443/oauth2/tokenP")!
        
        do {
            let data = try await service.requestService(
                url: url,
                method: .post,
                params: [
                    "grant_type": "client_credentials",
                    "appkey": appKey,
                    "appsecret": appSecret
                ],
                responseData: AccessTokenResponseModel.self
            )
            print(data)
            
            return AccessTokenModel(accessToken: data.accessToken, expireDate: Date())
        } catch {
            print(error)
            throw error
        }
    }
}
