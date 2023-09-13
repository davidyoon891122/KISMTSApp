//
//  MainCoordinator.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import UIKit

class MainTabbarCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    var tabbarController: UITabBarController
    
    init(tabbarController: UITabBarController) {
        self.tabbarController = tabbarController
    }
    
    func start() {
        let homeTabCoordinator = HomeTabCoordinator(tabbarController: self.tabbarController)
        homeTabCoordinator.start()
    }
}
