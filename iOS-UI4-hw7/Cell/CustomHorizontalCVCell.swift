//
//  CustomHorizontalCV.swift
//  iOS-UI4-hw7
//
//  Created by Alexey Lim on 2/6/24.
//

import UIKit
import SnapKit

class CustomHorizontalCVCell: UICollectionViewCell {
    
    private let saladImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "darkSalad")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var saladLabel: UILabel = {
        let label = UILabel()
        label.text = "Salad"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "16.278 recipes"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        saladImageConfig()
        saladLabelConfig()
        recipeLabelConfig()
    }
    
    private func saladImageConfig() {
        addSubview(saladImage)
        
        saladImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func saladLabelConfig() {
        addSubview(saladLabel)
        
        saladLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(70)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
    
    private func recipeLabelConfig() {
        addSubview(recipeLabel)
        
        recipeLabel.snp.makeConstraints { make in
            make.top.equalTo(saladLabel.snp.bottom).offset(2)
            make.leading.equalTo(contentView.snp.leading).offset(2)
        }
    }
}
