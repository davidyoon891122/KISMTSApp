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
                
                let accessTokenModel = await repository.requestToken(appKey: apiKey, appSecret: apiSecret)
                    
                guard let accessTokenModel = accessTokenModel else {
                    print("받아온 결과 값이 없네요 버그에요 버끄!")
                    return
                }
                
                UserDefaultsManager.shared.saveAccessToken(accessTokenModel: accessTokenModel)
                mainCoordinator.goToMainTabbarController()
            }
        }
    }
    
    func hasValidAccessToken() -> Bool  {
        do {
            let accessTokenModel = try UserDefaultsManager.shared.loadAccessToken()
            print(accessTokenModel)
            
            if isExpiredToken(expiredDate: accessTokenModel.expireDate) {
                print("Have a valid Token!!  Don't request an AccessToken !")
                return false
            } else {
                return true
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
