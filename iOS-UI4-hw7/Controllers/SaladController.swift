//
//  ViewController.swift
//  iOS-UI4-hw7
//
//  Created by Alexey Lim on 2/6/24.
//

import UIKit
import SnapKit

class SaladController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    private let width = UIScreen.main.bounds.width
    
    private var users: [User] = []
    
    private lazy var backBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var saladLabel: UILabel = {
        let label = UILabel()
        label.text = "Salad"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var searchBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let horizontalCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layer.cornerRadius = 16
        cv.backgroundColor = .black
        
        return cv
    }()
    
    private lazy var sortByLabel: UILabel = {
        let label = UILabel()
        label.text = "Sort by"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    
    private lazy var mostPopularLabel: UILabel = {
        let label = UILabel()
        label.text = "Most Popular"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var arrowUpDownBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.tintColor = .systemRed
        return button
    }()
    
    private let verticalCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 100) / 2, height: 220)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layer.cornerRadius = 16
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        horizontalCV.dataSource = self
        horizontalCV.register(CustomHorizontalCVCell.self, forCellWithReuseIdentifier: "horizontalCV")
        
        verticalCV.dataSource = self
        verticalCV.register(CustomVerticalCVCell.self, forCellWithReuseIdentifier: "verticalCV")
        
        setupUI()
        setupData()
    }
    
    private func setupData() {
        users = [
            User(foodImage: "salad", markBtn: "bookmark.fill", foodLabel: "Vegetable and Fruit Green Salad", userlogo: "person.crop.circle", name: "Willard Purnel"),
            User(foodImage: "salad2", markBtn: "bookmark", foodLabel: "Vegetable & Fruit  Salad with Balsa", userlogo: "person.crop.circle", name: "Jane Cooper"),
            User(foodImage: "salad2", markBtn: "bookmark", foodLabel: "Fresh Seasoned Vegetable Salad", userlogo: "person.crop.circle", name: "Phylis Godley"),
            User(foodImage: "salad3", markBtn: "bookmark.fill", foodLabel: "Vegetable Lettuce Salad with Simple", userlogo: "person.crop.circle", name: "Clinton Mcclure")
        ]
    }
    
    private func setupUI() {
        backBtnConfig()
        saladLabelConfig()
        searchBtnConfig()
        horizontalCVConfig()
        sortByLabelConfig()
        mostPopularLabelConfig()
        verticalCVConfig()
    }
    
    private func backBtnConfig() {
        view.addSubview(backBtn)
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(32)
        }
    }
    
    private func saladLabelConfig() {
        view.addSubview(saladLabel)
        
        saladLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(backBtn.snp.trailing).offset(8)
            make.centerY.equalTo(backBtn.snp.centerY)
        }
    }
    
    private func searchBtnConfig() {
        view.addSubview(searchBtn)
        
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(saladLabel.snp.centerY)
        }
    }
    
    private func horizontalCVConfig() {
        view.addSubview(horizontalCV)
        
        horizontalCV.snp.makeConstraints { make in
            make.top.equalTo(saladLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(150)
        }
    }
    
    private func sortByLabelConfig() {
        view.addSubview(sortByLabel)
        
        sortByLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalCV.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func mostPopularLabelConfig() {
        view.addSubview(mostPopularLabel)
        view.addSubview(arrowUpDownBtn)
        
        arrowUpDownBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(sortByLabel.snp.centerY)
        }
        
        mostPopularLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrowUpDownBtn.snp.leading).offset(-6)
            make.centerY.equalTo(sortByLabel.snp.centerY)
        }
    }
    
    private func verticalCVConfig() {
        view.addSubview(verticalCV)
        
        verticalCV.snp.makeConstraints { make in
            make.top.equalTo(sortByLabel.snp.bottom).offset(18)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension SaladController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizontalCV {
            return 1
        } else {
            return users.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizontalCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCV", for: indexPath) as! CustomHorizontalCVCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "verticalCV", for: indexPath) as! CustomVerticalCVCell
            cell.setCellData(image: users[indexPath.row].foodImage,
                             recipeText: users[indexPath.row].foodLabel,
                             username: users[indexPath.row].name,
                             bookmark: users[indexPath.row].markBtn,
                             userLogo: users[indexPath.row].userlogo)
            return cell
        }
    }
}
