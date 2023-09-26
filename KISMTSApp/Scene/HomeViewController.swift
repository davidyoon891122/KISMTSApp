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
    
    private lazy var accountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Account Number"
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var lookUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 4.0
        button.setTitle("LookUp", for: .normal)
        
        button.addTarget(self, action: #selector(didTapLookUpButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var accountInfoView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4.0
        view.backgroundColor = .secondarySystemBackground
        [
            accountTextField,
            lookUpButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        
        accountTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.Design.offset)
            $0.leading.equalToSuperview().offset(Constants.Design.offset)
            $0.bottom.equalToSuperview().offset(-Constants.Design.offset)
        }
        
        lookUpButton.snp.makeConstraints {
            $0.leading.equalTo(accountTextField.snp.trailing).offset(Constants.Design.offset)
            $0.centerY.equalTo(accountTextField)
            $0.trailing.equalToSuperview().offset(-Constants.Design.offset)
            $0.width.equalTo(80)
        }
        
        lookUpButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            MyStockCell.self,
            forCellWithReuseIdentifier: MyStockCell.identifier
        )
        
        return collectionView
    }()
    
    private var homeViewModel: HomeViewModelType
    
    private var datasource: UICollectionViewDiffableDataSource<Int, Int>!
    
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
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureDatasource()
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        
        let maxLength = 10
        let combinedLength = currentText.count + string.count - range.length
            
        if combinedLength <= maxLength {
            return true
        } else {
            return false
        }
    }
}

private extension HomeViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [
            accountInfoView,
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        accountInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(Constants.Design.offset)
            $0.trailing.equalToSuperview().offset(-Constants.Design.offset)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(accountInfoView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(72)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(72)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyStockCell.identifier, for: indexPath) as? MyStockCell else { return UICollectionViewCell() }
            
            return cell
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems([0, 1, 2])
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc
    func didTapDetailButton() {
        homeViewModel.inputs.moveToDetailView()
    }
    
    func configureNavigation() {
        navigationItem.title = "MyAsset"
    }
    
    @objc
    func didTapLookUpButton() {
        guard let accountNumber = accountTextField.text,
              accountNumber.isEmpty != true,
              accountNumber.count == 10 else {
            print("Please check account info again")
            return
        }
        
        print(accountNumber)
        
        homeViewModel.inputs.requestMyBalance(account: accountNumber)
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController(homeViewModel: HomeViewModel(
            homeTabCoordinator: HomeTabCoordinator(tabbarController: UITabBarController()),
            repository: HomeRepository(service: MockService())
        ))
            .showPreview()
    }
}
#endif
