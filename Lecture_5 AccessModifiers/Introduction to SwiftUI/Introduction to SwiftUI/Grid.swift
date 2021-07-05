//
//  Grid.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 04/07/21.
//  Copyright © 2021 Mojave. All rights reserved.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item: Identifiable,ItemView:  View{
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item],viewForItem: @escaping (Item) -> ItemView ){
        self.items = items
        self.viewForItem = viewForItem //Error saying nonEscaping parameter
    }
    
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View{
        ForEach(items) {item in
            self.body(for: item,in: layout)
        }
    }
    
    func body(for item: Item,in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
  
    
    //MARK:- Group basically groups all the views and if it doesnt have any view it return some empty Content View
//    func body(for item: Item,in layout: GridLayout) -> some View{
//        let index = items.firstIndex(matching: item)
//        return Group {
//            if index != nil{
//                 viewForItem(item)
//                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
//                    .position(layout.location(ofItemAt: index!))
//            }
//        }
//    }

}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
