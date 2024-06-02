//
//  CustomVerticalCVCellCollectionViewCell.swift
//  iOS-UI4-hw7
//
//  Created by Alexey Lim on 2/6/24.
//

import UIKit

class CustomVerticalCVCell: UICollectionViewCell {
    
     let recipeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "salad")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var bookmarkBtn: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "dkvnfjdnvkfj"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var userImage: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alexey"
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 16
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        recipeImageConfig()
        bookmarkBtnConfig()
        recipeLabelConfig()
        userImageConfig()
        nameLabelConfig()
    }
    
    private func recipeImageConfig() {
        addSubview(recipeImage)
        
        recipeImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func recipeLabelConfig() {
        addSubview(recipeLabel)
        
        recipeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(80)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    private func bookmarkBtnConfig() {
        addSubview(bookmarkBtn)
        
        bookmarkBtn.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
        }
    }
    
    private func userImageConfig() {
        addSubview(userImage)
        
        userImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.leading.equalToSuperview().offset(2)
            make.height.width.equalTo(40)
        }
    }
    
    private func nameLabelConfig() {
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(userImage.snp.trailing).offset(2)
            make.centerY.equalTo(userImage.snp.centerY)
        }
    }
    
    func setCellData(image: String, recipeText: String, username: String, bookmark: String, userLogo: String) {
        recipeImage.image = UIImage(named: image)
        bookmarkBtn.setImage(UIImage(systemName: bookmark), for: .normal)
        recipeLabel.text = recipeText
        nameLabel.text = username
        userImage.setImage(UIImage(systemName: userLogo), for: .normal)
    }
}
