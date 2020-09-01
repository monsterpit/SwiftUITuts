//
//  ContentView.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 30/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //Obseravble object when object change redraw
    //SwiftUI redraw the the that only change because its identifiable
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
                Text(card.content).foregroundColor(.black)
            }
            else{
                RoundedRectangle(cornerRadius: 10)
            }
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
            
        } .font(.system(size: fontSize(for: size)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

//MARK: - Drawing Constants
let cornerRadius: CGFloat = 10
let edgeLineWidth: CGFloat = 3

func fontSize(for size: CGSize) -> CGFloat{
    return min(size.width,size.height) * 0.75
}
