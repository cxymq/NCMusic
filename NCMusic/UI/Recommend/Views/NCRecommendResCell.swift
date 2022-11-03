//
//  NCRecommendResCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//
import AlamofireImage
import UIKit
import SnapKit

class NCRecommendResCell: NCBaseTableViewCell {
    private let picImgView = UIImageView.init()
    private let titleLb = UILabel.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        addSubview(picImgView)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
