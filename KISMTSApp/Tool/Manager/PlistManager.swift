//
//  PlistManager.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/12.
//

import Foundation

class PlistManager {
    static let shared: PlistManager = PlistManager()
    
    func loadKisApi() -> [String: Any] {
        if let plistURL = Bundle.main.url(forResource: "ApiKey", withExtension: "plist") {
            do {
                let plistData = try Data(contentsOf: plistURL)
                let plist = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil)
                
                if let dictionary = plist as? [String: Any] {
                    return dictionary
                }
            } catch {
                print("Error reading plist: \(error)")
                return [:]
            }
        }
        return [:]
    }
}
