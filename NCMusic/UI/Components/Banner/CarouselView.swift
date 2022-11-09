//
//  CarouselView.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/3.
// https://medium.com/swlh/swift-carousel-759800aa2952

import Foundation
import UIKit

struct CarouselData {
    let imageUrl: String
    let url: String
}

class CarouselView: UIView {
    
    // MARK: - Subviews
    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.cellId)
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.hidesForSinglePage = true
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    // MARK: - Properties
    private var carouselData = [CarouselData]()
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = .init(width: NCScreenW - 20, height: 160)
        carouselLayout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        carouselLayout.minimumLineSpacing = 20
        carouselCollectionView.collectionViewLayout = carouselLayout
        addSubview(carouselCollectionView)
        carouselCollectionView.snp.makeConstraints { make in
            make.top.left.equalTo(0)
            make.size.equalTo(CGSize(width: NCScreenW, height: 160))
        }

        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: NCScreenW, height: 20))
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CarouselView: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return carouselData.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as? CarouselCell else { return UICollectionViewCell() }

      let imageUrl = carouselData[indexPath.row].imageUrl
      let url = carouselData[indexPath.row].url

      cell.configure(imageUrl: imageUrl, url: url)

      return cell
   }
}

extension CarouselView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage()
    }
}

// MARK: - Public
extension CarouselView {
    public func configureView(with data: [CarouselData]) {
        pageControl.numberOfPages = data.count

        carouselData = data
        carouselCollectionView.reloadData()
    }
}

private extension CarouselView {
    func getCurrentPage() -> Int {
        
        let visibleRect = CGRect(origin: carouselCollectionView.contentOffset, size: carouselCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return currentPage
    }
}
