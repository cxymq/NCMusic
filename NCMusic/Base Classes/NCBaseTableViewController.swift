//
//  NCBaseTableViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Foundation
import UIKit
import SnapKit

class NCBaseTableViewController: NCBaseViewController {
    public var dataSource: NSArray = []
    let tableView: UITableView
    var tableViewStyle: UITableView.Style = .plain

    init(style: UITableView.Style) {
        tableViewStyle = style
        tableView = UITableView.init(frame: .zero, style: tableViewStyle)
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.theme_backgroundColor = globalBgColor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView.init()
    }
}
