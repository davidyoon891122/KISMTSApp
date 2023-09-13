//
//  ViewController.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var tokenButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8.0
        button.layer.masksToBounds = true
        
        button.setTitle("Token", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()

    private var authViewModel: UpdateViewModelType
    
    init(authViewModel: UpdateViewModelType) {
        self.authViewModel = authViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
        bindUI()
    }

}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [
            tokenButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
    
        tokenButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(50.0)
        }
    }
    
    func bindUI() {
        tokenButton.addTarget(self, action: #selector(didTapTokenButton), for: .touchUpInside)
    }
    
    @objc
    func didTapTokenButton() {
        print("Did Tap tokenButton")
        authViewModel.inputs.requestToken()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController(authViewModel: UpdateViewModel(repository: Repository(service: Service()), mainCoordinator: MainCoordinator(navigationController: UINavigationController())))
            .showPreview()
    }
}
#endif
