//
//  NCSectionHeaderView.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/11.
//

import Foundation
import UIKit

class NCSectionHeaderView: UITableViewHeaderFooterView {
    private let titleLb = UILabel()
    private let moreBtn = UIButton.init(type: .custom)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(title: String, isMore: Bool) {
        titleLb.text = title
        if isMore {
            moreBtn.setTitle("更多", for: .normal)
        } else {
            moreBtn.setTitle("播放", for: .normal)
        }
    }
    
    func setupView() {
        titleLb.font = UIFont.boldSystemFont(ofSize: 15)
        titleLb.theme_textColor = globalTitleColor
        addSubview(titleLb)
        titleLb.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
        }
        
        moreBtn.layer.borderWidth = 0.5
        moreBtn.layer.borderColor = UIColor.lightGray.cgColor
        moreBtn.layer.cornerRadius = 10
        moreBtn.layer.masksToBounds = true
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreBtn.theme_setTitleColor(globalSubtitleColor, forState: .normal)
        addSubview(moreBtn)
        moreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(titleLb.snp.centerY)
            make.right.equalTo(-10)
            make.size.equalTo(CGSize(width: 45, height: 20))
        }
    }
}

extension NCSectionHeaderView: ReuseIdentifierProviding {}
