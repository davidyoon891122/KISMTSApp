//
//  UpdateViewController.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/13.
//

import UIKit
import SnapKit
import Combine

final class UpdateViewController: UIViewController {
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 1.0
        
        return progressView
    }()
    
    private var updateViewModel: UpdateViewModelType
    
    private var cancellable: [AnyCancellable] = []
    
    init(updateViewModel: UpdateViewModelType) {
        self.updateViewModel = updateViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.updateViewModel.inputs.requestToken()
        }
    }
    
    deinit {
        cancellable = []
    }
}

private extension UpdateViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            progressView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        progressView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func bindViewModel() {
        updateViewModel.outputs.errorPassThroughSubject
            .sink(receiveValue: { [weak self] error in
                guard let self = self else { return }
                print("UpdateViewController present popupView with error message: \(error)")
                
                let customPopupViewController = CustomPopupViewController(error: error)
                customPopupViewController.modalPresentationStyle = .overFullScreen
                
                self.present(customPopupViewController, animated: false)
            })
            .store(in: &cancellable)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UpdateViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UpdateViewController(updateViewModel: UpdateViewModel(repository: UpdateRepository(service: Service()), mainCoordinator: MainCoordinator(navigationController: UINavigationController())))
            .showPreview()
    }
}
#endif
