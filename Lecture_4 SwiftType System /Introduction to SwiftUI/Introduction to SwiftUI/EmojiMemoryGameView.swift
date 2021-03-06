//
//  EmojiMemoryGameView.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 30/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //Obseravble object when object change redraw
    //SwiftUI redraw the the that only change because its identifiable
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        Grid(viewModel.cards) {card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }.padding(10)
        }
        .foregroundColor(.orange)
        .padding()  //padding for whole Views
        
    }
}

//struct have function , properties(vars) and behavior like its a view
struct CardView: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View{
        ZStack {  // stack one over the other
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white) //override the foregroundColor
                 RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content).foregroundColor(.black)
            }
            else{
                if !card.isMatched{
                    RoundedRectangle(cornerRadius: 10)
                }
            }
        } .font(.system(size: fontSize(for: size)))
    }
    
    //MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat{
        return min(size.width,size.height) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

