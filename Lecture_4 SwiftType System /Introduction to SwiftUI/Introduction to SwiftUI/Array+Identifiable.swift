//
//  Array+Identifiable.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 04/07/21.
//  Copyright © 2021 Mojave. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching : Element) -> Int{
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return 0 //TODO: bogus!
    }
}
