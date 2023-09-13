//
//  AuthViewModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol UpdateViewModelInput {
    func requestToken()
    func isValidAccessToken() -> Bool
}

protocol UpdateViewModelOutput {
    
}

protocol UpdateViewModelType {
    var inputs: UpdateViewModelInput { get }
    var outputs: UpdateViewModelOutput { get }
}


class UpdateViewModel: UpdateViewModelType, UpdateViewModelInput, UpdateViewModelOutput {
    var inputs: UpdateViewModelInput { self }
    var outputs: UpdateViewModelOutput { self }
    
    private var repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func requestToken() {
        if isValidAccessToken() {
            print("move to HomeVC")
        } else {
            Task {
                let keyDictionary = PlistManager.shared.loadKisApi()
                
                guard let apiKey = keyDictionary["appKey"] as? String,
                    let apiSecret = keyDictionary["appSecret"] as? String
                else {
                    print("appKey, appSecret을 확인해 주세요.")
                    return
                }
                
                let accessTokenModel = await repository.requestToken(appKey: apiKey, appSecret: apiSecret)
                    
                guard let accessTokenModel = accessTokenModel else {
                    print("받아온 결과 값이 없네요 버그에요 버끄!")
                    return
                }
                
                UserDefaultsManager.shared.saveAccessToken(accessTokenModel: accessTokenModel)
            }
        }
    }
    
    func isValidAccessToken() -> Bool  {
        do {
            let accessTokenModel = try UserDefaultsManager.shared.loadAccessToken()
            print(accessTokenModel)
            
            if accessTokenModel.isValid {
                print("Have a valid Token!!  Don't request an AccessToken !")
                return true
            } else {
                return false
            }
        } catch {
            print("error: \(error.localizedDescription)")
            return false
        }
    }
    
    func isExpiredToken(expiredDate: Int) -> Bool {
        
        
        
        return false
    }
    
    
}
