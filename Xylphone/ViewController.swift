//
//  ViewController.swift
//  Xylphone
//
//  Created by Mohanad on 7/25/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(button: sender.currentTitle!)
        
        //Reduces the sender's opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    func playSound(button: String) {
        // finding the sound file in our app bundle
        try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        let url = Bundle.main.url(forResource: button, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
