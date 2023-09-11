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
                let data = await repository.requestToken()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
}
