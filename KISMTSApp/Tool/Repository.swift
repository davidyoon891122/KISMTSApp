//
//  Repository.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol RepositoryType {
    func requestToken() async
}

class Repository: RepositoryType {
    private var service: ServiceType
    
    init(service: ServiceType) {
        self.service = service
    }
    
    func requestToken() async {
        let url = URL(string: "https://openapi.koreainvestment.com:9443/oauth2/tokenP")!
        
        do {
            let data = try await service.requestService(
                url: url,
                method: .post,
                params: [
                    "grant_type": "client_credentials",
                    "appkey": "",
                    "appsecret": ""
                ],
                responseData: AccessTokenResponseModel.self
            )
            print(data)
        } catch {
            print(error)
        }
    }
}
