//
//  NCSettingSwitchCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/20.
//

import Foundation
import UIKit

class NCSettingSwitchCell: NCBaseTableViewCell {
    public var title: String! {
        didSet {
            titleLb.text = title
        }
    }
    
    private let picImgView = UIImageView()
    private let titleLb = UILabel()
    private let themeSwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        picImgView.layer.cornerRadius = 3
        picImgView.layer.masksToBounds = true
        picImgView.theme_image = settingThemeImg
        addSubview(picImgView)
        picImgView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize(width: 35, height: 35))
        }
        
        titleLb.font = UIFont.systemFont(ofSize: 18)
        titleLb.theme_textColor = globalTitleColor
        addSubview(titleLb)
        titleLb.snp.makeConstraints { make in
            make.left.equalTo(picImgView.snp.right).offset(10)
            make.centerY.equalTo(self.contentView)
        }
        
        themeSwitch.isOn = false
        addSubview(themeSwitch)
        themeSwitch.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.centerY.equalTo(self.contentView)
        }
    }
}
