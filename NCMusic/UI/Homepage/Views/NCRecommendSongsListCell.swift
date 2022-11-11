//
//  NCRecommendSongsCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/11.
//

import Foundation
import UIKit
import Alamofire

class NCRecommendSongsCell: NCBaseTableViewCell {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 140)
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 50)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NCSongsCell.self, forCellWithReuseIdentifier: NCAlbumCell.standardReuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var songs: Array<Creative>! {
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

extension NCRecommendSongsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let creative = songs[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NCSongsCell.standardReuseIdentifier, for: indexPath) as! NCSongsCell
        cell.config(creative: creative)
        return cell
    }
}

extension NCRecommendSongsCell: UICollectionViewDelegate {
    
}

class NCSongsCell: UICollectionViewCell {
    
}
