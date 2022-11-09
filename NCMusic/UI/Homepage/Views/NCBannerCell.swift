//
//  NCBannerCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/9.
//

import Foundation
import UIKit

class NCBannerCell: NCBaseTableViewCell {
    let carouselView = CarouselView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        addSubview(carouselView)
        carouselView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(160)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
