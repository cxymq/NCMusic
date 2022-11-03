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

        setupView()
    }

    func setupView() {
        
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

