//
//  Array+Only.swift
//  Introduction to SwiftUI
//
//  Created by Mojave on 05/07/21.
//  Copyright © 2021 Mojave. All rights reserved.
//

import Foundation

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}
