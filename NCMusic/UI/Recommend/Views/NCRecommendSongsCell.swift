//
//  NCRecommendSongsCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Alamofire
import AlamofireImage
import UIKit
import SnapKit

class NCRecommendSongsCell: NCBaseTableViewCell {
    public var model: NCRecommendSongsModel! {
        didSet {
            titleLb.text = model.name
            var names: String = ""
            model.ar.forEach { ar in
                names.append(ar.name)
                names.append("/")
            }
            if names.count > 0 {
                names.remove(at: names.index(before: names.endIndex))
            }
            names.append(" - ")
            names.append(model.name)
            nameLb.text = names
            
            self.picImgView.image = UIImage(named: "avatar")
            let newUrl = model.al.picUrl.imageUrlAddParams(width: 45, height: 45);
            AF.request(newUrl).responseImage { response in
                if case .success(let image) = response.result {
                    self.picImgView.image = image
                }
            }
        }
    }
    
    private let picImgView = UIImageView()
    private let titleLb = UILabel()
    private let nameLb = UILabel()
    private let videoBtn = UIButton(type: .custom)
    private let moreBtn = UIButton(type: .custom)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        picImgView.layer.cornerRadius = 3
        picImgView.layer.masksToBounds = true
        addSubview(picImgView)
        picImgView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        titleLb.font = UIFont.systemFont(ofSize: 18)
        titleLb.theme_textColor = globalTitleColor
        addSubview(titleLb)
        titleLb.snp.makeConstraints { make in
            make.left.equalTo(picImgView.snp.right).offset(10)
            make.topMargin.equalTo(picImgView.snp.topMargin).offset(2)
            make.right.equalTo(-80)
        }
        
        nameLb.font = UIFont.systemFont(ofSize: 12)
        nameLb.theme_textColor = globalSubtitleColor
        addSubview(nameLb)
        nameLb.snp.makeConstraints { make in
            make.leftMargin.equalTo(titleLb.snp.leftMargin)
            make.bottomMargin.equalTo(picImgView.snp.bottomMargin).offset(-2)
            make.right.equalTo(-80)
        }
        
        moreBtn.theme_setImage(globalMoreImg, forState: .normal)
        addSubview(moreBtn)
        moreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-20)
            make.size.equalTo(CGSize(width: 15, height: 15))
        }
        
        videoBtn.theme_setImage(globalVideoImg, forState: .normal)
        addSubview(videoBtn)
        videoBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(moreBtn.snp.left).offset(-20)
            make.size.equalTo(CGSize(width: 20, height: 15))
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
