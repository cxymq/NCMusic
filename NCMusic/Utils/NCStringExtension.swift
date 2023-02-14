//
//  NCStringExtension.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/13.
//

import Foundation
import UIKit

extension String {
    func imageUrlAddParams(width: CGFloat, height: CGFloat) -> String {
        let scale: CGFloat = UIScreen.main.scale
        let param = "param=" + String(format: "%.f", width * scale) + "y" + String(format: "%.f", height * scale);
        return self.appending("?").appending(param)
    }
    
    static func playCountToString(count: Int) -> String {
        var playCount = "0"
        if (count <= 0) {
            return playCount
        } else if (count < 10000) {
            playCount = String(count)
        } else if (count < 100000000) {
            playCount = String(format: "%.1f 万", Double(count) / 10000.0)
            playCount = playCount.replacingOccurrences(of: ".0", with: "")
        } else {
            playCount = String(format: "%.2f", roundf(Float(((Double(count) / 100000 * 100000) / 100000000.0) * 100.0)) / 100.0)
            if (playCount.contains(".00")) {
                playCount = playCount.replacingOccurrences(of: ".00", with: "")
            } else if (playCount.contains(".0")) {
                playCount = playCount.replacingOccurrences(of: ".0", with: "")
            }
            playCount = playCount.appending(" 亿")
        }
        return playCount
    }

    static func durationToString(duration: TimeInterval) -> String {
        var playTime = "00:00"
        if (duration <= 0) {
            return playTime
        }
        if (duration < 60) {
            playTime = String(format: "00:%02.f", duration)
        } else {
            playTime = String(format: "%02.f:%02.f", duration / 60, duration.truncatingRemainder(dividingBy: 60))
        }
        return playTime
    }
}
