//  4th Step
//  HomeInteractor.swift
//  ViperBasicArchitecture
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

typealias SkuItem = (skuid: String, quantity: Int)

protocol HomeUseCase {
    func getGroceries(completion: GroceriesClosure) -> Void
    func addToCart(skuItem: SkuItem) -> Bool
    func getCartItem(skuId: String) -> CartItem
}

class HomeInteractor {
    var service: GroceriesAPI
    var database: CartDB
    
    init(service: GroceriesAPI, database: CartDB) {
        self.service = service
        self.database = database
    }
}

extension HomeInteractor: HomeUseCase {
    func getCartItem(skuId: String) -> CartItem {
        return self.database.getCartItem(using: skuId)
    }
    
    func addToCart(skuItem: SkuItem) -> Bool {
        guard skuItem.quantity > 0 else {
            return self.database.deleteCart(using: skuItem.skuid)
        }
        return self.database.updateCart(using: CartItem(skuid: skuItem.skuid, value: skuItem.quantity))
    }
    
    func getGroceries(completion: (GroceryResult) -> Void) {
        self.service.fetchGroceries { result in
            completion(result)
        }
    }
}
