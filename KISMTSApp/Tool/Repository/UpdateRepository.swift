//
//  Repository.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol UpdateRepositoryType {
    func requestToken(appKey: String, appSecret: String) async throws -> AccessTokenModel
    
    
}

class UpdateRepository: UpdateRepositoryType {
    private var service: ServiceType
    
    init(service: ServiceType) {
        self.service = service
    }
    
    func requestToken(appKey: String, appSecret: String) async throws -> AccessTokenModel {
        do {
            let data = try await service.requestService(
                url: URLInfo.accessToken.url,
                method: .post,
                params: [
                    "grant_type": "client_credentials",
                    "appkey": appKey,
                    "appsecret": appSecret
                ],
                responseData: AccessTokenResponseModel.self
            )
            print(data)
            
            return AccessTokenModel(
                accessToken: data.accessToken,
                tokenType: data.tokenType,
                accessTokenExpiredDate: data.accessTokenExpiredDate
            )
        } catch {
            print(error)
            throw error
        }
    }
}
