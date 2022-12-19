//
//  NCPlayerController.swift
//  NCMusic
//
//  Created by nazimai on 2022/11/25.
//

import Foundation
import UIKit

class NCPlayerController: UIViewController {
    let funView = UIView()
    let sliderView = UIView()
    let menuView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupView()
    }
    
    func setupView() {
        // background img
        let resPath = Bundle.main.url(forResource: "res", withExtension: "bundle")
        let imgPath = Bundle(url: resPath!)?.path(forResource: "fsl", ofType: "png")
        let img = UIImage(contentsOfFile: imgPath!)
        let imgView = UIImageView(image: img!.blurImage())
        imgView.contentMode = .scaleAspectFill
        view.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(0)
        }
        // navigation
        setupNavigationView()
        // function
        setupFunctionView()
        // slider
        setupSliderView()
        // menu
        setupMenuView()
        // cover img
        setupCoverImgView()
    }
}

extension NCPlayerController {
    func setupNavigationView() {
        let navigation = UIView()
        view.addSubview(navigation)
        navigation.snp.makeConstraints { make in
            make.top.equalTo(IS_NOTCH ? 40 : 20)
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
        view.addSubview(menuView)
        menuView.snp.makeConstraints { make in
            make.bottom.equalTo(sliderView.snp.top).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(50)
        }

        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "showIcon"), for: .normal)
        menuView.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
}

extension NCPlayerController {
    func setupSliderView() {
        view.addSubview(sliderView)
        sliderView.snp.makeConstraints { make in
            make.bottom.equalTo(funView.snp.top).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(50)
        }
    }
}

extension NCPlayerController {
    func setupFunctionView() {
        view.addSubview(funView)
        funView.snp.makeConstraints { make in
            make.bottom.equalTo(IS_NOTCH ? -50 : -20)
            make.left.right.equalTo(0)
            make.height.equalTo(50)
        }

        let playBtn = UIButton(type: .custom)
        playBtn.setImage(UIImage(named: "play"), for: .normal)
        playBtn.setImage(UIImage(named: "pause"), for: .selected)
        funView.addSubview(playBtn)
        playBtn.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        playBtn.addTarget(self, action: #selector(playControl), for: .touchUpInside)
    }

    @objc func playControl() {
        
    }
}

