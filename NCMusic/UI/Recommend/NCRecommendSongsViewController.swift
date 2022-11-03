//
//  NCRecommendSongsViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Foundation
import UIKit

class NCRecommendSongsViewController: NCBaseTableViewController {
    let encoder = JSONEncoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        encoder.outputFormatting = .prettyPrinted
        
        self.navigationItem.title = "每日推荐"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NCRecommendSongsCell.self, forCellReuseIdentifier: NCRecommendSongsCell.standardReuseIdentifier)
        loadData()
    }
    
    //MARK: - get data
    func loadData() {
        provider.request(.recommendSongs) { [self] result in
            //print("recommendSongs: \(result)")
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data // Data, your JSON response is probably in here!
                let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                print("recommendSongs statusCode: \(statusCode)")
                
                do {
                    let dataJson = try JSONSerialization.jsonObject(with: data) as! NSDictionary

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let resultDic = try decoder.decode(NCDailySongs.self, from: JSONSerialization.data(withJSONObject: dataJson))
                    //print("recommendSongs data: \(resultDic)")
                    self.dataSource = resultDic.dailySongs as NSArray
                    self.tableView.reloadData()

                } catch let error {
                    print("recommendSongs json error: \(error)")
                }
            case let .failure(error):
                print("recommendSongsErrors: \(error)")
            }
        }
    }
}

extension NCRecommendSongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NCRecommendSongsCell = tableView.dequeueReusableCell(withIdentifier: NCRecommendSongsCell.standardReuseIdentifier, for: indexPath) as! NCRecommendSongsCell
        cell.model = self.dataSource[indexPath.row] as? NCRecommendSongsModel
        return cell
    }
}

extension NCRecommendSongsViewController: UITableViewDelegate {
    
}
