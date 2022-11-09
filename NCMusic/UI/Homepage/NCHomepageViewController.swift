//
//  NCHomepageViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/30.
//

import Foundation
import UIKit

class NCHomepageViewController: NCBaseTableViewController {
    private var homepageBanners = [CarouselData]()
    var carouselView = CarouselView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.navigationItem.title = "首页"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NCBannerCell.self, forCellReuseIdentifier: NCBannerCell.standardReuseIdentifier)
        loadData()
    }

    //MARK: - get data
    func loadData() {
        provider.request(.homepageBlockPage) { [self] result in
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
                    let resultDic = try decoder.decode(NCHomepageModel.self, from: JSONSerialization.data(withJSONObject: dataJson))

                    self.dataSource = resultDic.blocks! as NSArray
                    let block:Block = self.dataSource.firstObject! as! Block
                    let homepage_banners = block.extInfo?.banners
                    homepage_banners?.forEach({ banner in
                        self.homepageBanners.append(.init(imageUrl: banner.pic ?? "", url: banner.url ?? ""))
                    })

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

extension NCHomepageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NCBannerCell = tableView.dequeueReusableCell(withIdentifier: NCBannerCell.standardReuseIdentifier, for: indexPath) as! NCBannerCell
        cell.carouselView.configureView(with: homepageBanners)
        return cell
    }
}

extension NCHomepageViewController: UITableViewDelegate {
    
}

