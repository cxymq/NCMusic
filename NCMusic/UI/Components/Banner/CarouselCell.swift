//
//  CarouselCell.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/3.
//  https://medium.com/swlh/swift-carousel-759800aa2952

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class CarouselCell: UICollectionViewCell {
    
    // MARK: - SubViews
    
    private lazy var imageView = UIImageView()
    
    // MARK: - Properties
    
    static let cellId = "CarouselCell"
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setups
private extension CarouselCell {
    func setupUI() {
        backgroundColor = .clear
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
    }
}

// MARK: - Public
extension CarouselCell {
    public func configure(imageUrl: String, url: String) {
        imageView.image = UIImage(named: "avatar")
        let newUrl = imageUrl.imageUrlAddParams(width: 300, height: 160);
        AF.request(newUrl).responseImage { [self] response in
            if case .success(let image) = response.result {
                self.imageView.image = image
            }
        }
    }
}
