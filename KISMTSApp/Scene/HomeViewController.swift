//
//  HomeViewController.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import UIKit

final class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension HomeViewController {
    func setupViews() {
        view.backgroundColor = .systemCyan
    }
}
