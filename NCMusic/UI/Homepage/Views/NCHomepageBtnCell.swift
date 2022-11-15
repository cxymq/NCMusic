//
//  NCHomepageBtnCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/15.
//

import Foundation
import UIKit

class NCHomepageBtnCell: NCBaseTableViewCell {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 50
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NCHomeBtnCell.self, forCellWithReuseIdentifier: NCHomeBtnCell.standardReuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    var btns: Array<Dictionary<String, String>>! {
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
        
        btns = [["title": "每日推荐", "url": "bangbangtang"],
                ["title": "私人 FM", "url": "bingqilin"],
                ["title": "歌单", "url": "dianxin"],
                ["title": "排行榜", "url": "hanbaobao"],
                ["title": "有声书", "url": "hebaodan"],
                ["title": "数字专辑", "url": "kaoji"],
                ["title": "直播", "url": "pijiu"],
        ]
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NCHomepageBtnCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return btns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let btnDic = btns[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NCHomeBtnCell.standardReuseIdentifier, for: indexPath) as! NCHomeBtnCell
        cell.config(dic: btnDic)
        return cell
    }
}

extension NCHomepageBtnCell: UICollectionViewDelegate {}

class NCHomeBtnCell: UICollectionViewCell {
    private let picImgView = UIImageView()
    private let titleLb = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        theme_backgroundColor = globalBgColor

        setupView()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(dic: Dictionary<String, String>) {
        guard let title = dic["title"] else {
            return
        }
        titleLb.text = title
        
        guard let url = dic["url"] else {
            return
        }
        picImgView.image = UIImage(named: url)
    }
    
    func setupView() {
        picImgView.contentMode = .scaleToFill
        addSubview(picImgView)
        picImgView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(13)
            make.size.equalTo(CGSize(width: 34, height: 34))
        }
        picImgView.image = UIImage(named: "avatar")

        titleLb.font = UIFont.systemFont(ofSize: 12)
        titleLb.theme_textColor = globalTitleColor
        titleLb.textAlignment = .center
        addSubview(titleLb)
        titleLb.snp.makeConstraints { make in
            make.top.equalTo(picImgView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.width.equalTo(60)
        }
    }
}

extension NCHomeBtnCell: ReuseIdentifierProviding {}
