//
//  AuthViewModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation

protocol UpdateViewModelInput {
    func requestToken()
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
