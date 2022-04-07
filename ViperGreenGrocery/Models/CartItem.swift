//
//  CartItem.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

struct CartItem {
    let skuid: String
    let value: Int
    
    init(skuid: String, value: Int) {
        self.skuid = skuid
        self.value = value
    }
}
