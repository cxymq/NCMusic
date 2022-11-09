//
//  NCHomepageViewController.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/30.
//

import Foundation
import UIKit

class NCHomepageViewController: UIViewController {
    private var flowLayout = UICollectionViewFlowLayout()
    private var collectionView: UICollectionView
    private var dataSource = [Block]()
    private var homepageBanners = [CarouselData]()
    var carouselView = CarouselView()

    init() {
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

        super.init(nibName: nil, bundle: nil)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        loadData()
        setupView()
    }

    func setupView() {
        setupCarouselView()
    }
    
    func setupCarouselView() {
        view.addSubview(carouselView)
        carouselView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(100)
            make.height.equalTo(160)
        }
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

                    self.dataSource = resultDic.blocks!
                    let block:Block = self.dataSource.first!
                    let homepage_banners = block.extInfo?.banners
                    homepage_banners?.forEach({ banner in
                        self.homepageBanners.append(.init(imageUrl: banner.pic ?? "", url: banner.url ?? ""))
                    })
                    carouselView.configureView(with: homepageBanners)

                    //self.tableView.reloadData()

                } catch let error {
                    print("recommendSongs json error: \(error)")
                }
            case let .failure(error):
                print("recommendSongsErrors: \(error)")
            }
        }
    }
}

extension NCHomepageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension NCHomepageViewController: UICollectionViewDelegate {
    
}

