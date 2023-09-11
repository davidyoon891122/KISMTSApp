//
//  AccessTokenResponseModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

struct AccessTokenResponseModel: Decodable {
    let accessToken: String
    let tokenType: String
    let expireDate: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expireDate = "expires_in"
    }
}
