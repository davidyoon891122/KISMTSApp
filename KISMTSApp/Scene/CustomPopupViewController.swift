//
//  CustomPopupView.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/25.
//

import UIKit
import SnapKit

final class CustomPopupViewController: UIViewController {
    private lazy var titleLabel: UIView = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .label
        label.numberOfLines = 3
        
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.backgroundColor = UIColor.label.cgColor
        button.layer.cornerRadius = 8.0
        
        button.setTitle("Confirm", for: .normal)
        
        button.addTarget(self, action: #selector(didTapConformButton), for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8.0
        
        [
            titleLabel,
            descriptionLabel,
            confirmButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.Design.offset)
            $0.leading.equalToSuperview().offset(Constants.Design.offset)
            $0.trailing.equalToSuperview().offset(-Constants.Design.offset)
        }
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Constants.Design.offset)
            $0.leading.equalToSuperview().offset(Constants.Design.offset)
            $0.trailing.equalToSuperview().offset(-Constants.Design.offset)
            $0.bottom.equalTo(confirmButton.snp.top).offset(-Constants.Design.offset)
        }
        
        confirmButton.snp.makeConstraints {
            $0.height.equalTo(Constants.Design.buttonHeight)
            $0.leading.equalToSuperview().offset(Constants.Design.offset)
            $0.trailing.equalToSuperview().offset(-Constants.Design.offset)
            $0.bottom.equalToSuperview().offset(-Constants.Design.offset)
        }
        
        return view
    }()
    
    init(error: String) {
        super.init(nibName: nil, bundle: nil)
        self.descriptionLabel.text = error
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomPopupViewController {
    func setupViews() {
        view.backgroundColor = .black.withAlphaComponent(0.3)
        [
            containerView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(Constants.Design.offset)
            $0.trailing.equalToSuperview().offset(-Constants.Design.offset)
        }
    }
    
    @objc
    func didTapConformButton() {
        self.dismiss(animated: false)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CustomPopupViewPreview: PreviewProvider {
    static var previews: some View {
        CustomPopupViewController(error: Constants.Mock.mockErrorMessage)
            .showPreview()
    }
}
#endif
