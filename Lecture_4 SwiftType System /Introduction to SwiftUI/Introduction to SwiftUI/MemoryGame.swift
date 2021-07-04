//
//  MemoryGame.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 31/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(card: Card){
        print("card chosen \(card)")
        if let chosenIndex = self.cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
           
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{ //Binary operator '==' cannot be applied to two 'CardContent' operands
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else {
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            self.cards[chosenIndex].isFaceUp = true
        }
        
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int //can be String too
    }
}
