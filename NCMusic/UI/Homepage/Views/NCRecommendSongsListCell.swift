//
//  NCRecommendSongsListCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/11.
//

import Foundation
import UIKit
import Alamofire

class NCRecommendSongsListCell: NCBaseTableViewCell {
    private let collectionView: UICollectionView = {
        let layout = NCStyleLayout()
        layout.itemSize = CGSize(width: NCScreenW - 30 - 20, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.collectionView?.isPagingEnabled = true
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30 + 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NCSongsCell.self, forCellWithReuseIdentifier: NCSongsCell.standardReuseIdentifier)
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

extension NCRecommendSongsListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let creative = songs[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NCSongsCell.standardReuseIdentifier, for: indexPath) as! NCSongsCell
        cell.config(resources: creative.resources ?? [])
        return cell
    }
}

extension NCRecommendSongsListCell: UICollectionViewDelegate {}

class NCSongsCell: UICollectionViewCell {
    private let songsView1 = UIView()
    private let picImgView1 = UIImageView()
    private let titleLb1 = UILabel()
    private let subTitleLb1 = UILabel()

    private let songsView2 = UIView()
    private let picImgView2 = UIImageView()
    private let titleLb2 = UILabel()
    private let subTitleLb2 = UILabel()

    private let songsView3 = UIView()
    private let picImgView3 = UIImageView()
    private let titleLb3 = UILabel()
    private let subTitleLb3 = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        theme_backgroundColor = globalBgColor

        setupView()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(songsView1)
        songsView1.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(65)
        }

        picImgView1.layer.cornerRadius = 3
        picImgView1.layer.masksToBounds = true
        songsView1.addSubview(picImgView1)
        picImgView1.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.centerY.equalTo(picImgView1)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        picImgView1.image = UIImage(named: "avatar")

        titleLb1.font = UIFont.systemFont(ofSize: 14)
        titleLb1.theme_textColor = globalTitleColor
        songsView1.addSubview(titleLb1)
        titleLb1.snp.makeConstraints { make in
            make.left.equalTo(picImgView1.snp.right).offset(10)
            make.topMargin.equalTo(picImgView1.snp.topMargin).offset(2)
            make.right.equalTo(-20)
        }

        subTitleLb1.font = UIFont.systemFont(ofSize: 12)
        subTitleLb1.textColor = .red
        songsView1.addSubview(subTitleLb1)
        subTitleLb1.snp.makeConstraints { make in
            make.leftMargin.equalTo(titleLb1.snp.leftMargin)
            make.bottomMargin.equalTo(picImgView1.snp.bottomMargin).offset(-2)
            make.right.equalTo(-20)
        }

        addSubview(songsView2)
        songsView2.snp.makeConstraints { make in
            make.top.equalTo(65 + 5)
            make.left.equalTo(10)
            make.height.equalTo(65)
        }

        picImgView2.layer.cornerRadius = 3
        picImgView2.layer.masksToBounds = true
        songsView2.addSubview(picImgView2)
        picImgView2.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.centerY.equalTo(picImgView2)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        picImgView2.image = UIImage(named: "avatar")

        titleLb2.font = UIFont.systemFont(ofSize: 14)
        titleLb2.theme_textColor = globalTitleColor
        songsView2.addSubview(titleLb2)
        titleLb2.snp.makeConstraints { make in
            make.left.equalTo(picImgView2.snp.right).offset(10)
            make.topMargin.equalTo(picImgView2.snp.topMargin).offset(2)
            make.right.equalTo(-20)
        }

        subTitleLb2.font = UIFont.systemFont(ofSize: 12)
        subTitleLb2.textColor = .red
        songsView2.addSubview(subTitleLb2)
        subTitleLb2.snp.makeConstraints { make in
            make.leftMargin.equalTo(titleLb2.snp.leftMargin)
            make.bottomMargin.equalTo(picImgView2.snp.bottomMargin).offset(-2)
            make.right.equalTo(-20)
        }

        addSubview(songsView3)
        songsView3.snp.makeConstraints { make in
            make.top.equalTo(65 * 2 + 5)
            make.left.equalTo(10)
            make.height.equalTo(65)
        }

        picImgView3.layer.cornerRadius = 3
        picImgView3.layer.masksToBounds = true
        songsView3.addSubview(picImgView3)
        picImgView3.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.centerY.equalTo(picImgView3)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        picImgView3.image = UIImage(named: "avatar")

        titleLb3.font = UIFont.systemFont(ofSize: 14)
        titleLb3.theme_textColor = globalTitleColor
        songsView3.addSubview(titleLb3)
        titleLb3.snp.makeConstraints { make in
            make.left.equalTo(picImgView3.snp.right).offset(10)
            make.topMargin.equalTo(picImgView3.snp.topMargin).offset(2)
            make.right.equalTo(-20)
        }

        subTitleLb3.font = UIFont.systemFont(ofSize: 12)
        subTitleLb3.textColor = .red
        songsView3.addSubview(subTitleLb3)
        subTitleLb3.snp.makeConstraints { make in
            make.leftMargin.equalTo(titleLb3.snp.leftMargin)
            make.bottomMargin.equalTo(picImgView3.snp.bottomMargin).offset(-2)
            make.right.equalTo(-20)
        }
    }
    
    func config(resources: [Resource]) {
        guard resources.count > 2 else {
            return
        }
        let res1 = resources[0]
        if var newUrl = res1.uiElement?.image?.imageURL {
            newUrl = newUrl.imageUrlAddParams(width: 45, height: 45);
            AF.request(newUrl).responseImage {[self] response in
                if case .success(let image) = response.result {
                    self.picImgView1.image = image
                }
            }
        }

        var title = res1.uiElement?.mainTitle?.title ?? ""
        var names: String = title
        names.append(" - ")
        if let artists = res1.resourceEXTInfo?.artists {
            artists.forEach { ar in
                names.append(ar.name!)
                names.append("/")
            }
            if names.count > 0 {
                names.remove(at: names.index(before: names.endIndex))
            }
            titleLb1.text = names
        }

        if let subTitle = res1.uiElement?.subTitle?.title {
            subTitleLb1.text = subTitle
        }

        let res2 = resources[1]
        if var newUrl = res2.uiElement?.image?.imageURL {
            newUrl = newUrl.imageUrlAddParams(width: 45, height: 45);
            AF.request(newUrl).responseImage {[self] response in
                if case .success(let image) = response.result {
                    self.picImgView2.image = image
                }
            }
        }

        title = res2.uiElement?.mainTitle?.title ?? ""
        names = title
        names.append(" - ")
        if let artists = res2.resourceEXTInfo?.artists {
            artists.forEach { ar in
                names.append(ar.name!)
                names.append("/")
            }
            if names.count > 0 {
                names.remove(at: names.index(before: names.endIndex))
            }
            titleLb2.text = names
        }

        if let subTitle = res2.uiElement?.subTitle?.title {
            subTitleLb2.text = subTitle
        }

        let res3 = resources[2]
        if var newUrl = res3.uiElement?.image?.imageURL {
            newUrl = newUrl.imageUrlAddParams(width: 45, height: 45);
            AF.request(newUrl).responseImage {[self] response in
                if case .success(let image) = response.result {
                    self.picImgView3.image = image
                }
            }
        }

        title = res3.uiElement?.mainTitle?.title ?? ""
        names = title
        names.append(" - ")
        if let artists = res3.resourceEXTInfo?.artists {
            artists.forEach { ar in
                names.append(ar.name!)
                names.append("/")
            }
            if names.count > 0 {
                names.remove(at: names.index(before: names.endIndex))
            }
            titleLb3.text = names
        }

        if let subTitle = res3.uiElement?.subTitle?.title {
            subTitleLb3.text = subTitle
        }
    }
}

extension NCSongsCell: ReuseIdentifierProviding {}
