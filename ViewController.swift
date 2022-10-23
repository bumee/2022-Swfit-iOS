//
//  ViewController.swift
//  lec1
//
//  Created by kibum on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices=["😀","😀","😀","😀"]
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        flipCountLabel.text="Flips: \(flipCount)"
        if let cardNumber=cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else{
            print("no chosen")
        }
    }
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle==emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor=UIColor.orange
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor=UIColor.white
        }
    }
    
}

