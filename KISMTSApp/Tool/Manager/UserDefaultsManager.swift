//
//  UserDefaultsManager.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private var userDefaults: UserDefaults
    
    init() {
        self.userDefaults = UserDefaults.standard
    }
    
    func loadAccessToken() throws -> AccessTokenModel {
        guard let data = userDefaults.object(forKey: "AccessToken") as? Data,
              let accessTokenModel = try? PropertyListDecoder().decode(AccessTokenModel.self, from: data)
        else {
            throw UserDefaultsError.notFound
        }
        
        return accessTokenModel
    }
    
    func saveAccessToken(accessTokenModel: AccessTokenModel) {
        let encodedData = try? PropertyListEncoder().encode(accessTokenModel)
        userDefaults.set(encodedData, forKey: "AccessToken")
    }
    
}


enum UserDefaultsError: Error {
    case notFound
}
