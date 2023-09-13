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
    var isValid: Bool {
        let currentDate = Date()
        let timeInterval = expireDate.timeIntervalSince(currentDate)
        let hoursInADay: TimeInterval = 24 * 60 * 60
        
        return timeInterval > 0 && timeInterval <= hoursInADay
    }
}
