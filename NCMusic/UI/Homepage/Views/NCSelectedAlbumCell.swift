//
//  NCSelectedAlbumCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/10.
//

import Foundation
import UIKit
import Alamofire

class NCSelectedAlbumCell: NCBaseTableViewCell {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 140)
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NCAlbumCell.self, forCellWithReuseIdentifier: NCAlbumCell.standardReuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var albums: Array<Creative>! {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
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

extension NCSelectedAlbumCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let creative = albums[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NCAlbumCell.standardReuseIdentifier, for: indexPath) as! NCAlbumCell
        cell.config(creative: creative)
        return cell
    }
}

extension NCSelectedAlbumCell: UICollectionViewDelegate {
    
}

class NCAlbumCell: UICollectionViewCell {
    private let imgView = UIImageView()
    private let titleLb = UILabel()
    private let countLb = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    func config(creative: Creative) {
        imgView.image = UIImage(named: "avatar")
        guard var newUrl = creative.uiElement?.image?.imageURL else {
            return
        }
        newUrl = newUrl.imageUrlAddParams(width: 200, height: 200);
        AF.request(newUrl).responseImage { [self] response in
            if case .success(let image) = response.result {
                self.imgView.image = image
            }
        }
        guard let resource = creative.resources?.first else {
            return
        }
        countLb.text = String.playCountToString(count: resource.resourceEXTInfo?.playCount ?? 0)

        titleLb.text = creative.uiElement?.mainTitle?.title
    }
}

extension NCAlbumCell: ReuseIdentifierProviding {}
