

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progessBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 300 , "Medium": 420 , "Hard": 720 ]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle
       totalTime = eggTimes[hardness!]!
        
        progessBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
     

    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            let percentageProgress = (Float(secondsPassed) / Float(totalTime))
            
            progessBar.progress = percentageProgress
        }else {
            timer.invalidate()
            titleLabel.text = "DONE"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
                player?.play()
                
                
            }
            
            
            
        }
    }
