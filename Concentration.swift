//
//  Concentration.swift
//  lec1
//
//  Created by kibum on 2022/10/26.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp=false
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            let matchingCard = card
            cards.append(card)
            cards.append(matchingCard)
        }
    }
}
