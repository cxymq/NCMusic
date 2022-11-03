//
//  NCSettingViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/20.
//

import Foundation
import UIKit

class NCSettingViewController: NCBaseTableViewController, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = [["深夜模式"]]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NCSettingSwitchCell.self, forCellReuseIdentifier: NCSettingSwitchCell.standardReuseIdentifier)
    }
}

extension NCSettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let datas: Array = self.dataSource.object(at: section) as! Array<String>
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas: Array = self.dataSource.object(at: indexPath.section) as! Array<String>
        
        let cell: NCSettingSwitchCell = tableView.dequeueReusableCell(withIdentifier: NCSettingSwitchCell.standardReuseIdentifier, for: indexPath) as! NCSettingSwitchCell
        cell.title = datas[indexPath.row]
        return cell
    }
}
