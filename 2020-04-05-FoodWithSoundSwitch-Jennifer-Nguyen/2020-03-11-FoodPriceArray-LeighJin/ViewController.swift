//
//  ViewController.swift
//  2020-03-11-FoodPriceArray-LeighJin
//
//  Created by Leigh Jin on 3/11/20.
//  Copyright © 2020 SFSU. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    @IBAction func playSoundSwitched(_ sender: UISwitch) {
        //using if let to make sure that audioplay exists before stoping
        if let playingAudioPlayer = audioPlayer {
            if !playSoundSwitch.isOn {
                playingAudioPlayer.stop()
            }
        }

    }
    
    
    let foodImageArray = ["chicken","hamburger","noodle","pasta","pizza","salad","steak"]
    
    let foodNameArray = ["Roasted Chicken", "Classic Burger", "Chicken Noodle Soup", "Bow-Tie Pasta","Pepperoni Pizza", "Italian Salad", "Grilled Steak"]
    let foodSoundArray = ["applause02", "cheering01", "cheering02","gong", "guitar", "magic", "movie"]
    
    let foodPriceArray = [13.99, 13.99, 11.99, 12.99, 11.99, 10.99, 15.99]
    var foodIndex = 0
    
    //define audio player
    var audioPlayer: AVAudioPlayer!
    
    //create a function that allow us to play audio
    func playSound (soundName: String) {
     
        //involve if-let syntax to unwrap optionals
        if let sound = NSDataAsset (name: soundName) {
            //deal with do-try-catch
            do {
                try audioPlayer = AVAudioPlayer (data: sound.data)
                audioPlayer.play ()
            } catch {
                print ("ERROR: \(error.localizedDescription)")
            }
    
        } else {
            print ("ERROR: Could not read data from the sound file")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImageView.image = UIImage(named: foodImageArray[0])
        foodPriceLabel.text = foodNameArray[0] + ": $" + "\(foodPriceArray[0])"
        playSound (soundName: foodSoundArray [0])
    }

    @IBAction func nextDishButtonClicked(_ sender: UIButton) {

        foodIndex += 1
        if foodIndex == foodImageArray.count {
            foodIndex = 0
        }
        foodImageView.image = UIImage(named: foodImageArray[foodIndex])
        foodPriceLabel.text = foodNameArray[foodIndex] + ": $" + "\(foodPriceArray[foodIndex])"
        if playSoundSwitch.isOn {
            playSound (soundName: foodSoundArray [foodIndex])
        }
        
    }
    

}

