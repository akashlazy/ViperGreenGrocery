//
//  GroceryResult.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

struct GroceryResult: Decodable {
    let groceries: [Grocery]
}

struct Grocery: Decodable {
    let id: String
    let title: String
    let image: String
    let description: String
    let price: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "sku-id"
        case title
        case image = "product_image"
        case description
        case price
    }
}
