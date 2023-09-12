//
//  AuthViewModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol AuthViewModelInput {
    func requestToken()
}

protocol AuthViewModelOutput {
    
}

protocol AuthViewModelType {
    var inputs: AuthViewModelInput { get }
    var outputs: AuthViewModelOutput { get }
}


class AuthViewModel: AuthViewModelType, AuthViewModelInput, AuthViewModelOutput {
    var inputs: AuthViewModelInput { self }
    var outputs: AuthViewModelOutput { self }
    
    private var repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    
    func requestToken() {
        Task {
            do {
                let keyDictionary = PlistManager.shared.loadKisApi()
                
                
                
                guard let apiKey = keyDictionary["appKey"] as? String,
                    let apiSecret = keyDictionary["appSecret"] as? String
                else {
                    print("appKey, appSecret을 확인해 주세요.")
                    return
                }
                
                
                
                let data = await repository.requestToken(appKey: apiKey, appSecret: apiSecret)
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
}
