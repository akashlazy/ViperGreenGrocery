//
//  StubService.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

typealias GroceriesClosure = (GroceryResult) -> Void

protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) -> Void
}

class StubService {
    static let shared = StubService()
    private init() {
        
    }
}

extension StubService: GroceriesAPI {
    func fetchGroceries(completion: GroceriesClosure) {
        if let url = Bundle.main.url(forResource: "list",  withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
            } catch {
                debugPrint("File Error", error)
            }
        }
    }
}
