//
//  NCHomepageViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/30.
//

import Foundation
import UIKit
import SideMenu

class NCHomepageViewController: NCBaseTableViewController {
    private var homepageBanners = [CarouselData]()
    private var selectedAlbums = [Creative]()
    private var isSelected = false
    private var recommendSongs = [Creative]()
    private var isRecommend = false
    private var radarAlbums = [Creative]()
    private var isRadar = false
    private var recommendLives = [EXTInfoElement]()
    private var isLives = false
    
    private var menu: SideMenuNavigationController?

    var carouselView = CarouselView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        menu = SideMenuNavigationController(rootViewController: NCSideMenuViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        SideMenuManager.default.leftMenuNavigationController = menu

        self.navigationItem.title = "首页"
        let menuButton = UIBarButtonItem(image: .actions, style: .plain, target: self, action: #selector(showMenuButtonPressed(_:)))
        navigationItem.leftBarButtonItem = menuButton
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NCBannerCell.self, forCellReuseIdentifier: NCBannerCell.standardReuseIdentifier)
        tableView.register(NCHomepageBtnCell.self, forCellReuseIdentifier: NCHomepageBtnCell.standardReuseIdentifier)
        tableView.register(NCSelectedAlbumCell.self, forCellReuseIdentifier: NCSelectedAlbumCell.standardReuseIdentifier)
        tableView.register(NCRecommendSongsListCell.self, forCellReuseIdentifier: NCRecommendSongsListCell.standardReuseIdentifier)
        tableView.register(NCRcmdLiveCell.self, forCellReuseIdentifier: NCRcmdLiveCell.standardReuseIdentifier)

        tableView.register(NCSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: NCSectionHeaderView.standardReuseIdentifier)
        loadData()
    }
    
    @objc func showMenuButtonPressed(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
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
                    let block: Block = self.dataSource.firstObject! as! Block
                    let exInfo = block.extInfo
                    switch (exInfo) {
                    case .none: break
                    case .some(.extInfoElementArray(_)):break
                    case .some(let .purpleEXTInfo(purpleInfo)):
                        let homepage_banners = purpleInfo.banners
                        homepage_banners?.forEach({ banner in
                            self.homepageBanners.append(.init(imageUrl: banner.pic ?? "", url: banner.url ?? ""))
                        })
                    }
                    // 推荐歌单
                    self.selectedAlbums = (self.dataSource[1] as! Block).creatives ?? []
                    if self.selectedAlbums.count > 0 {
                        self.isSelected = true
                    }

                    // 风格推荐
                    self.recommendSongs = (self.dataSource[2] as! Block).creatives ?? []
                    if self.recommendSongs.count > 0 {
                        self.isRecommend = true
                    }

                    // 雷达歌单
                    self.radarAlbums = (self.dataSource[3] as! Block).creatives ?? []
                    if self.radarAlbums.count > 0 {
                        self.isRadar = true
                    }
                    // lives
                    let block2: Block = self.dataSource[4] as! Block
                    let exInfo2 = block2.extInfo
                    switch (exInfo2) {
                    case .none: break
                    case .some(let .extInfoElementArray(extInfos)):
                        self.recommendLives = extInfos
                        if self.recommendLives.count > 0 {
                            self.isLives = true
                        }
                    case .some(.purpleEXTInfo(_)): break
                    }

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
        return 2 + (isSelected ? 1 : 0) + (isRecommend ? 1 : 0) + (isRadar ? 1 : 0) + (isLives ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        case 2:
            return isSelected ? 1 : 0
        case 3:
            return isRecommend ? 1 : 0
        case 4:
            return isRadar ? 1 : 0
        case 5:
            return isLives ? 1 : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 160.0
        case 1:
            return 60.0
        case 2:
            return isSelected ? 140.0 : 0
        case 3:
            return isRecommend ? 200.0 : 0
        case 4:
            return isRadar ? 140.0 : 0
        case 5:
            return isLives ? 140.0 : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var isMore = true
        switch section {
        case 0, 1:
            return nil
        case 2:
            if isSelected {
                break
            } else {
                return nil
            }
        case 3:
            if isRecommend {
                isMore = false
            } else {
                return nil
            }
        case 4:
            if isRadar {
                break
            } else {
                return nil
            }
        case 5:
            if isLives {
                break
            } else {
                return nil
            }
        default:
            return nil
        }
        let block = dataSource[section - 1] as! Block
        let title = block.uiElement?.subTitle?.title ?? ""
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: NCSectionHeaderView.standardReuseIdentifier) as? NCSectionHeaderView else {
            return nil
        }
        headerView.config(title: title, isMore: isMore)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0, 1:
            return 0.1
        case 2:
            return isSelected ? 45 : 0.1
        case 3:
            return isRecommend ? 45 : 0.1
        case 4:
            return isRadar ? 45 : 0.1
        case 5:
            return isLives ? 45 : 0.1
        default:
            return 0.1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: NCBannerCell = tableView.dequeueReusableCell(withIdentifier: NCBannerCell.standardReuseIdentifier, for: indexPath) as! NCBannerCell
            cell.carouselView.configureView(with: homepageBanners)
            cell.delegate = self
            return cell
        case 1:
            let cell: NCHomepageBtnCell = tableView.dequeueReusableCell(withIdentifier: NCHomepageBtnCell.standardReuseIdentifier, for: indexPath) as! NCHomepageBtnCell
            cell.btnSelectedHandle = { [weak self] (vc, item) in
                guard let self = self else { return }
                switch item {
                case 0:
                    self.navigationController?.pushViewController(NCRecommendSongsViewController(style: .plain), animated: true)
                default:
                    break
                }
            }
            return cell
        case 2:
            let cell: NCSelectedAlbumCell = tableView.dequeueReusableCell(withIdentifier: NCSelectedAlbumCell.standardReuseIdentifier, for: indexPath) as! NCSelectedAlbumCell
            cell.albums = selectedAlbums
            return cell
        case 3:
            let cell: NCRecommendSongsListCell = tableView.dequeueReusableCell(withIdentifier: NCRecommendSongsListCell.standardReuseIdentifier, for: indexPath) as! NCRecommendSongsListCell
            cell.songs = recommendSongs
            return cell
        case 4:
            let cell: NCSelectedAlbumCell = tableView.dequeueReusableCell(withIdentifier: NCSelectedAlbumCell.standardReuseIdentifier, for: indexPath) as! NCSelectedAlbumCell
            cell.albums = radarAlbums
            return cell
        case 5:
            let cell: NCRcmdLiveCell = tableView.dequeueReusableCell(withIdentifier: NCRcmdLiveCell.standardReuseIdentifier, for: indexPath) as! NCRcmdLiveCell
            cell.lives = recommendLives
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

extension NCHomepageViewController: NCBannerCellDelegate {
    func carouseSelected(index: Int, urlStr: String) {
        let webVC = NCWebviewController()
        webVC.urlStr = urlStr.nilString()
        self.navigationController?.pushViewController(webVC, animated: true)
    }
}

