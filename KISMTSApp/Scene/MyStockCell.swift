//
//  MyStockCell.swift
//  KISMTSApp
//
//  Created by 112751 on 2023/09/14.
//

import UIKit
import SnapKit

final class MyStockCell: UICollectionViewCell {
    static let identifier = "MyStockCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "한화생명"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "100주"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var nameLabelView: UIView = {
        let view = UIView()
        [
            nameLabel,
            amountLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        amountLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        amountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "303,500원"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var changePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "19,500원"
        label.textColor = .red
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var changePercentLabel: UILabel = {
        let label = UILabel()
        label.text = "+6.88%"
        label.textColor = .red
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var changeLabelView: UIView = {
        let view = UIView()
        [
            changePriceLabel,
            changePercentLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        changePriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        changePercentLabel.snp.makeConstraints {
            $0.centerY.equalTo(changePriceLabel)
            $0.leading.equalTo(changePriceLabel.snp.trailing).offset(16)
            $0.trailing.equalToSuperview()
        }
        
        changePercentLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return view
    }()
    
    private lazy var priceLabelVeiw: UIView = {
        let view = UIView()
        [
            priceLabel,
            changeLabelView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        changeLabelView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private let separatorView = SeparatorView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        [
            imageView,
            nameLabelView,
            priceLabelVeiw,
            separatorView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.width.height.equalTo(40)
        }
        
        nameLabelView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.centerY.equalTo(imageView)
        }
        
        nameLabelView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        priceLabelVeiw.snp.makeConstraints {
            $0.centerY.equalTo(nameLabelView)
            $0.leading.equalTo(nameLabelView.snp.trailing)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                containerView.backgroundColor = .secondarySystemBackground
            } else {
                containerView.backgroundColor = .systemBackground
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MyStockCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MyStockCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            MyStockCell()
        }
        .frame(width: UIScreen.main.bounds.width, height: 72)
        .previewLayout(.sizeThatFits)
    }
}

#endif
