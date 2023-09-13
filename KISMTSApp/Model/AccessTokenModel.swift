//
//  AccessTokenModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import Foundation

struct AccessTokenModel: Codable {
    let accessToken: String
    let expireDate: Date
}
