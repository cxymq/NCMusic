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

        setupView()
    }

    func setupView() {
        setupCarouselView()
    }
    
    func setupCarouselView() {
        let carouselView = CarouselView()
        view.addSubview(carouselView)
        carouselView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(100)
            make.height.equalTo(160)
        }
        var carouselData = [CarouselData]()
        carouselData.append(.init(imageUrl: "http://p1.music.126.net/pN0z3pArqlpKPyUuRC9ykA==/109951167888980089.jpg", url: ""))
        carouselData.append(.init(imageUrl: "http://p1.music.126.net/NhIdYkmT6sr4SmCqinUs9A==/109951167888972927.jpg", url: ""))
        carouselData.append(.init(imageUrl: "http://p1.music.126.net/NhIdYkmT6sr4SmCqinUs9A==/109951167888972927.jpg", url: ""))

        carouselView.configureView(with: carouselData)
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

