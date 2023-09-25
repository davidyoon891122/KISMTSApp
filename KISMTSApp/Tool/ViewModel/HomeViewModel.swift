//
//  HomeViewModel.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import Foundation
import Combine

protocol HomeViewModelInput {
    func moveToDetailView()
    func requestMyBalance()
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
    
    private var repository: HomeRepositoryType
    
    init(
        homeTabCoordinator: HomeTabCoordinator,
        repository: HomeRepositoryType
    ) {
        self.homeTabCoordinator = homeTabCoordinator
        self.repository = repository
    }
    
    
    func moveToDetailView() {
        homeTabCoordinator.goToHomeDetailView()
    }
    
    func requestMyBalance() {
        Task {
            do {
                try await repository.requestMyBalance()
            } catch {
                print("TODO: Display error message with popupView: \(error.localizedDescription)")
            }
        }
    }
    
}
