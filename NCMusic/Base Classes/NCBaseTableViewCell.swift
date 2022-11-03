//
//  NCBaseTableViewCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Foundation
import UIKit

class NCBaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.theme_backgroundColor = globalBgColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NCBaseTableViewCell: ReuseIdentifierProviding {}
