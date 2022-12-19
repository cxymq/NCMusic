//
//  NCPlayerController.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/25.
//

import Foundation
import UIKit

class NCPlayerController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        setupView()
    }
    func setupView() {
        // navigation
        setupNavigationView()
        // cover img
        setupCoverImgView()
        // menu
        setupMenuView()
        // slider
        setupSliderView()
        // function
        setupFunctionView()
    }
}

extension NCPlayerController {
    func setupNavigationView() {
        let navigation = UIView()
        //navigation.alpha = 0.0
        view.addSubview(navigation)
        navigation.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.right.equalTo(0)
            make.height.equalTo(50)
        }

        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "showIcon"), for: .normal)
        navigation.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)

        let titleLb = UILabel()
        titleLb.text = "马"
        titleLb.textAlignment = .center
        titleLb.textColor = .white
        titleLb.numberOfLines = 1
        titleLb.font = UIFont.systemFont(ofSize: 15)
        navigation.addSubview(titleLb)
        titleLb.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalTo(navigation)
            make.width.equalTo(200)
        }

        let subTitleLb = UILabel()
        subTitleLb.text = "福禄寿 FloruitShow"
        subTitleLb.textAlignment = .center
        subTitleLb.textColor = .lightGray
        subTitleLb.numberOfLines = 1
        subTitleLb.font = UIFont.systemFont(ofSize: 15)
        navigation.addSubview(subTitleLb)
        subTitleLb.snp.makeConstraints { make in
            make.top.equalTo(titleLb.snp.bottom).offset(2)
            make.centerX.equalTo(navigation)
            make.width.equalTo(200)
        }
    }

    @objc func back() {
        dismiss(animated: true)
    }
}

extension NCPlayerController {
    func setupCoverImgView() {
        
    }
}

extension NCPlayerController {
    func setupMenuView() {
        
    }
}

extension NCPlayerController {
    func setupSliderView() {
        
    }
}

extension NCPlayerController {
    func setupFunctionView() {
        
    }
}

