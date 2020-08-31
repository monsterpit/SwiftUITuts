//
//  ContentView.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 30/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        // HStack(spacing is cell spacing)
        HStack(spacing: 50){
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding()  //padding for whole Views
        .font(.largeTitle)
        
    }
}

//struct have function , properties(vars) and behavior like its a view
struct CardView: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        ZStack {  // stack one over the other
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white) //override the foregroundColor
                Text(card.content).foregroundColor(.black)
            }
            else{
                RoundedRectangle(cornerRadius: 10)
            }
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
