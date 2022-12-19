//
//  NCAudioPlayer.swift
//  NCMusic
//
//  Created by nazimai on 2022/12/13.
//

import AVKit
import Foundation

class NCAudioPlayer: NSObject {
    var player = AVAudioPlayer()
    static let shared = NCAudioPlayer()
    
    // Make sure the class has only one instance
    // Should not init or copy outside
    private override init() {}
    
    override func copy() -> Any {
        return self // NCAudioPlayer.shared
    }
    
    override func mutableCopy() -> Any {
        return self // NCAudioPlayer.shared
    }
    
    // Optional
    func reset() {
        // Reset all properties to default value
    }

    func playSound() {
        // Load a local sound file
        let audioPath = Bundle.main.path(forResource: "039655", ofType: "mp3")
        let audioUrl = URL(string: audioPath!)
        
        do {
            // Configure and activate the AVAudioSession
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.playback
            )

            try AVAudioSession.sharedInstance().setActive(true)

            // Play a sound
            player = try AVAudioPlayer(
                contentsOf: audioUrl!
            )
            player.delegate = self
            player.prepareToPlay()
            player.volume = 1.0

            player.play()
            print("play start")
        }
        catch {
            // Handle error
            print("play error")
        }
    }
}
extension NCAudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("successfully \(flag)")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("error \(error.debugDescription)")
    }
}

