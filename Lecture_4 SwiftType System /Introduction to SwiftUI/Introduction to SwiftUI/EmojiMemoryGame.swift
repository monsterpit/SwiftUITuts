//
//  EmojiMemory.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 31/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation

//ViewModel has to be class has many views can access same thing
class EmojiMemoryGame: ObservableObject{
    //@Published Property Wrapper , not a swift keyword
    //@Published will call objectWillChange.send() everytime the model changes
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
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
    //var objectWillChange: ObservableObjectPublisher  //Comes by default with ObservableObject we need to call it when something will change in model
    func choose(card: MemoryGame<String>.Card){
        //objectWillChange.send()   // will send object will change not how it will change
        model.choose(card: card)
    }
}
