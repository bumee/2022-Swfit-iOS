//
//  Card.swift
//  lec1
//
//  Created by kibum on 2022/10/26.
//

import Foundation

struct Card{
    var isFaceUp=false
    var isMatched=false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory+=1
        return identifierFactory
    }
    
    init(){
        self.identifier=Card.getUniqueIdentifier()
    }
}
