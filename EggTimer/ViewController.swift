

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    let eggTimes = ["Soft": 300, "Medium": 480, "Hard": 720]
    var soundPlay = true
    
    var player: AVAudioPlayer!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    @IBOutlet weak var hiddenButton: UIButton!
    
    
    @IBAction func stopSound(_ sender: UIButton) {
                
        player.stop()
        soundPlay = false
        self.hiddenButton.isHidden = true
        barProgress.progress = 0
        
        }
        
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        let result = eggTimes[hardness]!
        totalTime = result
        barProgress.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        print(result)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                
                self.secondsPassed += 1
                
                self.barProgress.progress = Float(self.secondsPassed) / Float(self.totalTime)
            
        } else {
            self.titleLabel.text = "DONE!"
                
                
                if(self.soundPlay == true) {
                    self.hiddenButton.isHidden = false

                func playSound() {
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    self.player = try! AVAudioPlayer(contentsOf: url!)
                    self.player.play()
                            
                }
                
                playSound()
                }
                }
                
                
        }
    }
    
    
}

