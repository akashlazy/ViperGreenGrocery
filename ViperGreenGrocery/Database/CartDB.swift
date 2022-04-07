//
//  CartDB.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

typealias CartCountClosure = (Int) -> Void

protocol CartDB {
    func updateCart(using cartItem: CartItem) -> Bool
    func getCount(closure: @escaping CartCountClosure)
    func deleteCart(using skuId: String) -> Bool
    func getCartItem(using skuId: String) -> CartItem
}
