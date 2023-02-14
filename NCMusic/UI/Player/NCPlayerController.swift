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
    let slider = UISlider(frame: .zero)
    let menuView = UIView()
    let musicModel = NCMusicModel(title: "马", author: "福禄寿 FloruitShow", duration: 341)
    var sliderTimer: Timer?
    let leftLb = UILabel()
    let rightLb = UILabel()
    var playDurationTimerSlider = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupView()

        sliderTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
            guard let this = self else { return }
            guard Double(this.musicModel.duration) > 0 else { return }
            this.playDurationTimerSlider += 1
            let progressTime = TimeInterval(this.playDurationTimerSlider)
            this.slider.value = Float(progressTime / this.musicModel.duration)
            this.leftLb.text = String.durationToString(duration: progressTime)
            this.rightLb.text = String.durationToString(duration: this.musicModel.duration - progressTime)
        })
        RunLoop.current.add(sliderTimer!, forMode: .common)
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
        titleLb.text = musicModel.title
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
        subTitleLb.text = musicModel.author
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
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }

        let btnSize = CGSize(width: 28, height: 28)
        let loveBtn = UIButton(type: .custom)
        loveBtn.setImage(UIImage(named: "love"), for: .normal)
        loveBtn.setImage(UIImage(named: "loved"), for: .selected)
        menuView.addSubview(loveBtn)
        loveBtn.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.size.equalTo(btnSize)
        }
        loveBtn.addTarget(self, action: #selector(love(sender:)), for: .touchUpInside)

        let downloadBtn = UIButton(type: .custom)
        downloadBtn.setImage(UIImage(named: "download"), for: .normal)
        downloadBtn.setImage(UIImage(named: "downloaded"), for: .selected)
        menuView.addSubview(downloadBtn)
        downloadBtn.snp.makeConstraints { make in
            make.topMargin.equalTo(loveBtn.snp_topMargin)
            make.centerX.equalTo(menuView.snp.centerX)
            make.size.equalTo(btnSize)
        }
        downloadBtn.addTarget(self, action: #selector(download(sender:)), for: .touchUpInside)

        let moreBtn = UIButton(type: .custom)
        moreBtn.setImage(UIImage(named: "more"), for: .normal)
        menuView.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { make in
            make.topMargin.equalTo(loveBtn.snp_topMargin)
            make.right.equalTo(-20)
            make.size.equalTo(btnSize)
        }
        moreBtn.addTarget(self, action: #selector(more), for: .touchUpInside)
    }

    @objc func love(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }

    @objc func download(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }

    @objc func more() {
        
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

        slider.thumbTintColor = .white
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .highlighted)
        slider.addTarget(self, action: #selector(silderTouchDown(sender:)), for: .touchDragInside)
        slider.addTarget(self, action: #selector(silderTouchCancel(sender:)), for: .touchDragOutside)
        sliderView.addSubview(slider)
        slider.snp.makeConstraints { make in
            make.center.equalTo(sliderView)
            make.left.equalTo(sliderView).offset(50)
            make.right.equalTo(sliderView).offset(-50)
            make.height.equalTo(1)
        }

        leftLb.text = "00:00"
        leftLb.textAlignment = .right
        leftLb.textColor = .lightGray
        leftLb.font = UIFont.systemFont(ofSize: 10)
        sliderView.addSubview(leftLb)
        leftLb.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(slider.snp.left).offset(-2)
            make.centerY.equalTo(sliderView)
        }

        rightLb.text = "05:41"
        rightLb.textColor = .lightGray
        rightLb.font = UIFont.systemFont(ofSize: 10)
        sliderView.addSubview(rightLb)
        rightLb.snp.makeConstraints { make in
            make.right.equalTo(0)
            make.left.equalTo(slider.snp.right).offset(2)
            make.centerY.equalTo(sliderView)
        }
    }

    @objc func silderTouchDown(sender: UISlider) {
        let value = sender.value
        let progressTime = musicModel.duration * Double(value) as TimeInterval
        leftLb.text = String.durationToString(duration: progressTime)
        rightLb.text = String.durationToString(duration: musicModel.duration - progressTime)
    }

    @objc func silderTouchCancel(sender: UISlider) {
        
    }
}

extension NCPlayerController {
    func setupFunctionView() {
        view.addSubview(funView)
        funView.snp.makeConstraints { make in
            make.bottom.equalTo(IS_NOTCH ? -50 : -20)
            make.left.right.equalTo(0)
            make.height.equalTo(80)
        }

        let playBtn = UIButton(type: .custom)
        playBtn.isSelected = true
        playBtn.setImage(UIImage(named: "play"), for: .normal)
        playBtn.setImage(UIImage(named: "pause"), for: .selected)
        funView.addSubview(playBtn)
        playBtn.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalTo(funView)
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        playBtn.addTarget(self, action: #selector(playControl(sender:)), for: .touchUpInside)

        let btnSize = CGSize(width: 35, height: 35)
        let lastBtn = UIButton(type: .custom)
        lastBtn.setImage(UIImage(named: "last"), for: .normal)
        funView.addSubview(lastBtn)
        lastBtn.snp.makeConstraints { make in
            make.top.equalTo(23)
            make.right.equalTo(playBtn.snp.left).offset(-30)
            make.size.equalTo(btnSize)
        }
        lastBtn.addTarget(self, action: #selector(playLast), for: .touchUpInside)

        let nextBtn = UIButton(type: .custom)
        nextBtn.setImage(UIImage(named: "next"), for: .normal)
        funView.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.topMargin.equalTo(lastBtn.snp_topMargin)
            make.left.equalTo(playBtn.snp.right).offset(30)
            make.size.equalTo(btnSize)
        }
        nextBtn.addTarget(self, action: #selector(playNext), for: .touchUpInside)

        let playSettingBtn = UIButton(type: .custom)
        playSettingBtn.setImage(UIImage(named: "loop"), for: .normal)
        funView.addSubview(playSettingBtn)
        playSettingBtn.snp.makeConstraints { make in
            make.topMargin.equalTo(lastBtn.snp_topMargin)
            make.right.equalTo(lastBtn.snp.left).offset(-30)
            make.size.equalTo(btnSize)
        }
        playSettingBtn.addTarget(self, action: #selector(playSetting), for: .touchUpInside)

        let playListBtn = UIButton(type: .custom)
        playListBtn.setImage(UIImage(named: "list"), for: .normal)
        funView.addSubview(playListBtn)
        playListBtn.snp.makeConstraints { make in
            make.topMargin.equalTo(playSettingBtn.snp_topMargin)
            make.left.equalTo(nextBtn.snp.right).offset(30)
            make.size.equalTo(btnSize)
        }
        playListBtn.addTarget(self, action: #selector(playList), for: .touchUpInside)
    }

    @objc func playLast() {
        
    }

    @objc func playNext() {
        
    }

    @objc func playList() {
        
    }

    @objc func playSetting() {
        
    }

    @objc func playControl(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            NCAudioPlayer.shared.play()
        } else {
            NCAudioPlayer.shared.pause()
        }
    }
}

