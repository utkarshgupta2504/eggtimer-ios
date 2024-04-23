//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barProgressView: UIProgressView!
    
    let eggTimes = ["Soft" : 3, "Medium": 4, "Hard": 7]
    
    var secondsRemaining : Int = 60
    var totalSeconds : Int = 60
    var timer : Timer?
    var player: AVAudioPlayer?
    
    @IBAction func onHardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        totalSeconds = eggTimes[hardness]!
        
        timer?.invalidate()
        
        barProgressView.progress = 0.0
        titleLabel.text = "One \(hardness) boiled egg, coming up!"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(secondsRemaining > 0) {
            print(secondsRemaining)
            secondsRemaining -= 1
            let percentage = 1.0 - Float(secondsRemaining) / Float(totalSeconds)
            
            UIView.animate(withDuration: 0.2) {
                self.barProgressView.progress = percentage
                self.view.layoutIfNeeded()
            }
            
            if secondsRemaining == 0 {
                titleLabel.text = "DONE!"
                playAlarm()
                timer!.invalidate()
            }
            
        }
    }
    
    func playAlarm() {
        let uri = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: uri!)
        player!.play()
    }
    

}
