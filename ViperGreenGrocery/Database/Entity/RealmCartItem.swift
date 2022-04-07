//
//  RealmCartItem.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation
import RealmSwift

class RealmCartItem: Object {
    @objc dynamic var skuid: String = ""
    @objc dynamic var value: Int = 0
    @objc dynamic var date: Date = Date()
    
    override class func primaryKey() -> String? {
        return "skuid"
    }
}

extension RealmCartItem {
    convenience init(cartItem: CartItem) {
        self.init()
        self.skuid = cartItem.skuid
        self.value = cartItem.value
    }
}

extension CartItem {
    init(realmCartItem: RealmCartItem) {
        self.skuid = realmCartItem.skuid
        self.value = realmCartItem.value
    }
}
