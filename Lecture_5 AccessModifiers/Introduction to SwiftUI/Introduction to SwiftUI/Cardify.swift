//
//  Cardify.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 13/07/21.
//  Copyright © 2021 Mojave. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(.white) //override the foregroundColor
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            else{
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
    
    //MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
}


extension View{
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
