//
//  ViewController.swift
//  EggTimer

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 400, "Hard": 700]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var player : AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: Any) {
        timer.invalidate()
        
        let hardness = (sender as AnyObject).currentTitle!!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed <= self.totalTime {
                self.progressBar.progress = Float(self.secondsPassed)/Float(self.totalTime)
                self.secondsPassed += 1
            } else {
                Timer.invalidate()
                self.titleLabel.text = "Time Up!"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
    }
}
