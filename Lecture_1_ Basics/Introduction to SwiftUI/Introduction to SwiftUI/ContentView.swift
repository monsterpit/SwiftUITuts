//
//  ContentView.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 30/08/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // HStack(spacing is cell spacing)
        HStack(spacing: 50){
            ForEach(0..<4) {index in
                CardView(isFaceUp: false)
            }
        }
        .foregroundColor(.orange)
        .padding()  //padding for whole Views
        .font(.largeTitle)
        
    }
}

//struct have function , properties(vars) and behavior like its a view
struct CardView: View{
    var isFaceUp: Bool
    var body: some View{
        ZStack {  // stack one over the other
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white) //override the foregroundColor
            }
            else{
                RoundedRectangle(cornerRadius: 10)
            }
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
            Text("Hello, World!").foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
