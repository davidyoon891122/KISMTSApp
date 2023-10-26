//
//  BalanceModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/27.
//

import Foundation

struct BalanceModel {
    let balanceStocks: [BalanceStockModel]
    
}

struct BalanceStockModel {
    let code: String
    let name: String
}
