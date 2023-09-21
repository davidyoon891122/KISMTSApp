//
//  HomeRepository.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/20.
//

import Foundation

protocol HomeRepositoryType {
    func requestMyBalance() async
}

class HomeRepository: HomeRepositoryType {
    
    private var service: ServiceType
    
    init(service: ServiceType) {
        self.service = service
    }
    
    func requestMyBalance() async {
        do {
            let accessToken = try UserDefaultsManager.shared.loadAccessToken()
            
            if accessToken.accessTokenExpiredDate.isValidStringDate {
                let bearToken = "\(accessToken.tokenType) \(accessToken.accessToken)"
                
                
                
                
                
            } else {
                print("TODO: Display popupView with requesting new access token")
            }
        } catch {
            print("TODO: Display error message with popupView")
            print(error)
        }
    }
}
