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
        homeViewModel.inputs.requestMyBalance()
    }
}

private extension HomeViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
        snapshot.appendItems([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc
    func didTapDetailButton() {
        homeViewModel.inputs.moveToDetailView()
    }
    
    func configureNavigation() {
        navigationItem.title = "MyAsset"
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
