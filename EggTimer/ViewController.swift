//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft" : 3, "Medium": 4, "Hard": 7]
    
    var secondsRemaining : Int = 60
    var timer : Timer?
    
    @IBAction func onHardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(secondsRemaining > 0) {
            print(secondsRemaining)
            secondsRemaining -= 1
        } else {
            titleLabel.text = "DONE!"
            timer!.invalidate()
        }
    }
    

}
