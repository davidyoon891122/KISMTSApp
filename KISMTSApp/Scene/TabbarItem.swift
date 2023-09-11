//
//  TabbarItem.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/01.
//

import UIKit

enum TabbarItem: CaseIterable {
    case watch
    case myAsset
    case news
    case settings
    
    var title: String {
        switch self {
        case .watch:
            return "Watch"
        case .myAsset:
            return "MyAsset"
        case .news:
            return "News"
        case .settings:
            return "Settings"
        }
    }
    
    var iconImage: (default: UIImage?, selected: UIImage?) {
        switch self {
        case .watch:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house.fill")
            )
        case .myAsset:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house.fill")
            )
        case .news:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house.fill")
            )
        case .settings:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house.fill")
            )
        }
    }
    
    
    
    var viewController: UIViewController {
        switch self {
        case .watch:
            return UIViewController()
        case .myAsset:
            return UIViewController()
        case .news:
            return UIViewController()
        case .settings:
            return UIViewController()
        }
    }
}
