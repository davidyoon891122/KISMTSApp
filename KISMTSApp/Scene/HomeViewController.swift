//
//  HomeViewController.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    private lazy var moveDetailButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Detail", for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(didTapDetailButton), for: .touchUpInside)
        
        return button
    }()
    
    private var homeViewModel: HomeViewModelType
    
    init(homeViewModel: HomeViewModelType) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        view.backgroundColor = .systemBackground
        
        [
            moveDetailButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        moveDetailButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func didTapDetailButton() {
        homeViewModel.inputs.moveToDetailView()
    }
}
