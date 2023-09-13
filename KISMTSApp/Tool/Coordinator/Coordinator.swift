//
//  Coordinator.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import Foundation

protocol Coordinator {
    var childCoordinator: [Coordinator] { get }
    func start()
}
