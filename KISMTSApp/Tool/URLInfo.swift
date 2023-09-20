//
//  URLInfo.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/20.
//

import Foundation

enum URLInfo {
    case accessToken
    case balance
    
    
    var url: URL {
        switch self {
        case .accessToken:
            return URL(string: "https://openapi.koreainvestment.com:9443/oauth2/tokenP")!
        case .balance:
            return URL(string: "https://openapi.koreainvestment.com:9443/uapi/domestic-stock/v1/trading/inquire-balance")!
        }
    }
}
