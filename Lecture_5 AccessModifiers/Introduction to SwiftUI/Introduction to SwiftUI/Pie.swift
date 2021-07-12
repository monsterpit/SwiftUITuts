//
//  Pie.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 12/07/21.
//  Copyright © 2021 Mojave. All rights reserved.
//

import SwiftUI

//Shape protocol conforms to View protocol
//Shape protocol by default implements body paramter which return view so we dont have to implement it
//But we have to implement path which is how to draw the shape
struct Pie: Shape{
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    func path(in rect: CGRect) -> Path {
        //rect is in which we are suppposed to fit our shape
        //almost all shapes if not all shapes usually use the space in the rect that is given to it
        //bc shape is view rect is gonna give space that was offered to it
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width,rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians)))
        
     //MARK:- Geometry of iOS
//        |
//        |
//        |________
//        Angle 0 is at right and not up in iOS
        
        
  //      in iOS coordinate 0,0 start from top left of the screen
//    So everything is opposite clockwise is antiClockwise
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise)
        p.addLine(to: center)
        return p
    }
}
