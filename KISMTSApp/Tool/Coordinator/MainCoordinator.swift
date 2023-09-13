//
//  MainCoordinator.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToUpdateView()
    }
    
    func goToUpdateView() {
        let updateViewModel = UpdateViewModel(repository: Repository(service: Service()), mainCoordinator: self)
        let updateVC = UpdateViewController(updateViewModel: updateViewModel)
        
        navigationController.pushViewController(updateVC, animated: false)
    }
    
    func goToMainTabbarController() {
        let tabbarController = UITabBarController()
        let mainTabbarCoordinator = MainTabbarCoordinator(tabbarController: tabbarController)
        childCoordinator.append(mainTabbarCoordinator)
        mainTabbarCoordinator.start()
        
        navigationController.setViewControllers([tabbarController], animated: false)
    }
    
    
}
