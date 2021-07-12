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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        if card.isFaceUp || !card.isMatched  {
               ZStack{  // stack one over the other
                
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content).foregroundColor(.black).font(.system(size: fontSize(for: size)))
                
            }
                //          .modifier(Cardify(isFaceUp: card.isFaceUp ))
              .cardify(isFaceUp: card.isFaceUp)
       }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat{
        return min(size.width,size.height) * 0.7
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

