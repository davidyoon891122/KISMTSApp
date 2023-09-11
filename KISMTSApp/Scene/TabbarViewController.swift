//
//  TabbarViewController.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/01.
//

import UIKit

final class TabbarViewController: UITabBarController {
    private var tabViewControllers: [UIViewController] = TabbarItem.allCases.map {
        let viewController = $0.viewController
        viewController.tabBarItem = UITabBarItem(title: $0.title, image: $0.iconImage.default, selectedImage: $0.iconImage.selected)
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = tabViewControllers
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TabbarViewControllerPreview: PreviewProvider {
    static var previews: some View {
        TabbarViewController()
            .showPreview()
    }
}
#endif

