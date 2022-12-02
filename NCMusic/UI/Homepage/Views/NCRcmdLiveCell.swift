//
//  NCRcmdLiveCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/12/2.
//

import Foundation
import UIKit
import Alamofire

class NCRcmdLiveCell: NCBaseTableViewCell {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 140)
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NCLiveCell.self, forCellWithReuseIdentifier: NCLiveCell.standardReuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var lives: Array<EXTInfoElement>! {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        theme_backgroundColor = globalBgColor
        setupView()
    }
    
    func setupView() {
        collectionView.theme_backgroundColor = globalBgColor
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(0)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NCRcmdLiveCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lives.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let creative = lives[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NCLiveCell.standardReuseIdentifier, for: indexPath) as! NCLiveCell
        cell.config(creative: creative)
        return cell
    }
}

extension NCRcmdLiveCell: UICollectionViewDelegate {
    
}

class NCLiveCell: UICollectionViewCell {
    private let imgView = UIImageView()
    private let titleLb = UILabel()
    private let countLb = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        theme_backgroundColor = globalBgColor
        setupview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupview() {
        imgView.contentMode = .scaleToFill
        imgView.layer.cornerRadius = 8.0
        imgView.layer.masksToBounds = true
        addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.left.right.equalTo(0)
            make.height.equalTo(100)
        }
        
        countLb.numberOfLines = 1
        countLb.text = "直播中"
        countLb.font = UIFont.systemFont(ofSize: 10)
        countLb.textColor = UIColor.white
        countLb.backgroundColor = .clear
        imgView.addSubview(countLb)
        countLb.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.right.equalTo(-5)
        }
        
        titleLb.numberOfLines = 2
        titleLb.font = UIFont.systemFont(ofSize: 12)
        titleLb.theme_textColor = globalTitleColor
        addSubview(titleLb)
        titleLb.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(5)
            make.left.right.equalTo(0)
        }
    }
    
    func config(creative: EXTInfoElement) {
        imgView.image = UIImage(named: "avatar")
        guard var newUrl = creative.cover else {
            return
        }
        newUrl = newUrl.imageUrlAddParams(width: 100, height: 100);
        AF.request(newUrl).responseImage { [weak self] response in
            guard let self = self else { return }
            if case .success(let image) = response.result {
                self.imgView.image = image
            }
        }

        titleLb.text = creative.title
    }
}

extension NCLiveCell: ReuseIdentifierProviding {}
