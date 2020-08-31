//
//  EmojiMemory.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 31/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation

//ViewModel has to be class has many views can access same thing
class EmojiMemoryGame{
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["👻","🎃","🦇"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in
             return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
