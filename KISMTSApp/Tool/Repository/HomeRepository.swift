//
//  HomeRepository.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/20.
//

import Foundation

protocol HomeRepositoryType {
    func requestMyBalance(account: String) async throws
}

class HomeRepository: HomeRepositoryType {
    
    private var service: ServiceType
    
    init(service: ServiceType) {
        self.service = service
    }
    
    func requestMyBalance(account: String) async throws {
        do {
            let accessToken = try UserDefaultsManager.shared.loadAccessToken()
            
            let apiDictionary = PlistManager.shared.loadKisApi()
            
            guard let appKey = apiDictionary["appKey"] as? String else { return }
            guard let appSecret = apiDictionary["appSecret"] as? String else { return }
            
            let accountIndex = account.index(account.startIndex, offsetBy: 8)
            let accountNumber = account[..<accountIndex]
            let accountType = account[accountIndex...]
            
            print("AccountNumber: \(accountNumber), AccountType: \(accountType)")
            
            if accessToken.accessTokenExpiredDate.isValidStringDate {
                let bearToken = "\(accessToken.tokenType) \(accessToken.accessToken)"
                let data = try await service.requestService(
                    url: URLInfo.balance.url,
                    method: .get,
                    responseData: BalanceResponseModel.self,
                    headers: [
                        "authorization": bearToken,
                        "appkey": appKey,
                        "appsecret": appSecret,
                        "tr_id": "TTTC8434R"
                    ],
                    params: [
                        "CANO": accountNumber,
                        "ACNT_PRDT_CD": accountType,
                        "AFHR_FLPR_YN": "N",
                        "OFL_YN": "",
                        "INQR_DVSN": "02",
                        "UNPR_DVSN": "01",
                        "FUND_STTL_ICLD_YN": "Y",
                        "FNCG_AMT_AUTO_RDPT_YN": "N",
                        "PRCS_DVSN": "00",
                        "CTX_AREA_FK100": "",
                        "CTX_AREA_NK100": ""
                    ]
                )
                
                print(data)
                
                
            } else {
                print("TODO: Display popupView with requesting new access token")
            }
        } catch {
            throw error
        }
    }
}
