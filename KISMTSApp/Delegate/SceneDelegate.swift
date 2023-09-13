//
//  SceneDelegate.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabbarController = UITabBarController()
        coordinator = MainCoordinator(tabbarController: tabbarController)
        coordinator?.start()
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }
}

