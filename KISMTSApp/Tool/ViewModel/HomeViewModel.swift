//
//  HomeViewModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import Foundation

protocol HomeViewModelInput {
    func moveToDetailView()
}

protocol HomeViewModelOutput {
    
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInput { get }
    var outputs: HomeViewModelOutput { get }
}

class HomeViewModel: HomeViewModelType, HomeViewModelInput, HomeViewModelOutput {
    var inputs: HomeViewModelInput { self }
    var outputs: HomeViewModelOutput { self }
    
    private var homeTabCoordinator: HomeTabCoordinator
    
    init(homeTabCoordinator: HomeTabCoordinator) {
        self.homeTabCoordinator = homeTabCoordinator
    }
    
    
    func moveToDetailView() {
        homeTabCoordinator.goToHomeDetailView()
    }
    
}
