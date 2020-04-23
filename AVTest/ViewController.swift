//
//  ViewController.swift
//  AVTest
//
//  Created by Josue Arambula on 4/22/20.
//  Copyright © 2020 Josue Arambula. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var soundEffect: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playVideo(_ sender: UIButton) {
        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else {
            return
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }
    
    @IBAction func playLocalVideo(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: "myVideo", ofType:"mp4")
        else {
            print("Error loading video")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true) {
            player.play()
        }
    }
    
    @IBAction func playLocalAudio(_ sender: Any) {
        let path = Bundle.main.path(forResource: "Hold The Line.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            print("Error in loading mp3 from local")
        }
    }
    
}

