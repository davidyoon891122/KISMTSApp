//
//  HomeTabCoordinator.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import UIKit

class HomeTabCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    let navigationController = UINavigationController()
    
    var tabbarController: UITabBarController
    
    init(tabbarController: UITabBarController) {
        self.tabbarController = tabbarController
    }
    
    func start() {
        let homeViewModel = HomeViewModel(homeTabCoordinator: self, repository: HomeRepository(service: Service()))
        let homeVC = HomeViewController(homeViewModel: homeViewModel)
        
        homeVC.tabBarItem = UITabBarItem(
            title: TabbarItem.myAsset.title,
            image: TabbarItem.myAsset.iconImage.default,
            selectedImage: TabbarItem.myAsset.iconImage.selected
        )
        
        navigationController.pushViewController(homeVC, animated: false)
        
        if var viewControllers = tabbarController.viewControllers {
            viewControllers.append(navigationController)
            tabbarController.viewControllers = viewControllers
        } else {
            tabbarController.viewControllers = [navigationController]
        }
    }
    
    
    func goToHomeDetailView() {
        let homeDetailViewController = HomeDetailViewController()
        
        navigationController.pushViewController(homeDetailViewController, animated: true)
    }
    
    
}
