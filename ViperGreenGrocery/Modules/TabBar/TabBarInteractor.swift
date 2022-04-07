//
//  TabBarInteractor.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import Foundation

protocol TabBarUseCase {
    func getCartCount(closure: @escaping CartCountClosure)
}

class TabBarInteractor {
    
    let database: CartDB
    
    init(database: CartDB) {
        self.database = database
    }
}

extension TabBarInteractor: TabBarUseCase {
    func getCartCount(closure: @escaping CartCountClosure) {
        database.getCount(closure: closure)
    }
}
