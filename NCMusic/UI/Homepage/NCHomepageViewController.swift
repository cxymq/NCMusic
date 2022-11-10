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
    private var selectedAlbums = [Creative]()

    var carouselView = CarouselView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.navigationItem.title = "首页"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NCBannerCell.self, forCellReuseIdentifier: NCBannerCell.standardReuseIdentifier)
        tableView.register(NCSelectedAlbumCell.self, forCellReuseIdentifier: NCSelectedAlbumCell.standardReuseIdentifier)
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
                    // banners
                    let block:Block = self.dataSource.firstObject! as! Block
                    let homepage_banners = block.extInfo?.banners
                    homepage_banners?.forEach({ banner in
                        self.homepageBanners.append(.init(imageUrl: banner.pic ?? "", url: banner.url ?? ""))
                    })
                    
                    // 精选音单
                    self.selectedAlbums = (self.dataSource[1] as! Block).creatives ?? []

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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 160.0
        case 1:
            return 140.0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return "精选音单"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 45
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: NCBannerCell = tableView.dequeueReusableCell(withIdentifier: NCBannerCell.standardReuseIdentifier, for: indexPath) as! NCBannerCell
            cell.carouselView.configureView(with: homepageBanners)
            return cell
        case 1:
            let cell: NCSelectedAlbumCell = tableView.dequeueReusableCell(withIdentifier: NCSelectedAlbumCell.standardReuseIdentifier, for: indexPath) as! NCSelectedAlbumCell
            cell.albums = selectedAlbums
            return cell
        default:
            let cell: NCBannerCell = tableView.dequeueReusableCell(withIdentifier: NCBannerCell.standardReuseIdentifier, for: indexPath) as! NCBannerCell
            cell.carouselView.configureView(with: homepageBanners)
            return cell
        }
    }
}

extension NCHomepageViewController: UITableViewDelegate {
    
}

