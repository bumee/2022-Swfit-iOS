//
//  ViewController.swift
//  lec1
//
//  Created by kibum on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game=Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {didSet { flipCountLabel.text = "Flips: \(flipCount)"}}
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices=["😀","🙃","😂","😍"]

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber=cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("no chosen")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor=UIColor.white
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor=card.isMatched ? UIColor.systemBackground : UIColor.orange
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    var emoji = [Int: String]()
}

