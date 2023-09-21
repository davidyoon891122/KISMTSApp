//
//  AccessTokenResponseModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

struct AccessTokenResponseModel: Decodable {
    let accessToken: String
    let accessTokenExpiredDate: String
    let tokenType: String
    let expiredTime: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case accessTokenExpiredDate = "access_token_token_expired"
        case tokenType = "token_type"
        case expiredTime = "expires_in"
    }
}
