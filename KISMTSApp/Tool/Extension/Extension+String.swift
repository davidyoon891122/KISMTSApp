//
//  Extension+String.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/19.
//

import Foundation

extension String {
    var isValidStringDate: Bool {
        let currentDate = Date()
        
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let targetDate = dateFomatter.date(from: self) else { return false }
        
        let result = currentDate.compare(targetDate)
        
        switch result {
        case .orderedAscending:
            return true
        case .orderedSame:
            return false
        case .orderedDescending:
            return false
        }
    }
}
