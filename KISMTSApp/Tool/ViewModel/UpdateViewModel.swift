//
//  AuthViewModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/11.
//

import Foundation
import Combine

protocol UpdateViewModelInput {
    func requestToken()
    func hasValidAccessToken() -> Bool
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
    
    private var mainCoordinator: MainCoordinator
    
    init(repository: RepositoryType, mainCoordinator: MainCoordinator) {
        self.repository = repository
        self.mainCoordinator = mainCoordinator
    }
    
    func requestToken() {
        if hasValidAccessToken() {
            print("move to HomeVC")
            mainCoordinator.goToMainTabbarController()
        } else {
            Task {
                let keyDictionary = PlistManager.shared.loadKisApi()
                
                guard let apiKey = keyDictionary["appKey"] as? String,
                    let apiSecret = keyDictionary["appSecret"] as? String
                else {
                    print("appKey, appSecret을 확인해 주세요.")
                    return
                }
                do {
                    let accessTokenModel = try await repository.requestToken(appKey: apiKey, appSecret: apiSecret)
                    
                    UserDefaultsManager.shared.saveAccessToken(accessTokenModel: accessTokenModel)
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.mainCoordinator.goToMainTabbarController()
                    }
                    
                } catch {
                    print("Please diplay error with popupView: \(error)")
                }
            }
        }
    }
    
    func hasValidAccessToken() -> Bool  {
        do {
            let accessTokenModel = try UserDefaultsManager.shared.loadAccessToken()
            print(accessTokenModel)
            
            if accessTokenModel.accessTokenExpiredDate.isValidStringDate {
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
    
    func isExpiredToken(expiredDate: Date) -> Bool {
        let currentDate = Date()
        let timeInterval = currentDate.timeIntervalSince(expiredDate)
        let hoursInADay: TimeInterval = 24 * 60 * 60
        
        print("RemainTime: \(timeInterval), hoursInADay: \(hoursInADay)")
        
        return timeInterval < 0 || timeInterval >= hoursInADay
    }
}
