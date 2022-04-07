//
//  GroceryHTTPRouter.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import Foundation
import Alamofire

enum GroceryHttpRouter {
    case getGroceryCategores
    case getGroceries(categoryId: String)
    case downloadThumbnailImage(imageName: String)
    case downloadImage(imageName: String)
}

extension GroceryHttpRouter: HttpRouter {
    var baseURLString: String {
        return "https://letscodeeasy.com/groceryapi/public/api"
    }
    
    var path: String {
        switch (self) {
        case .getGroceryCategores:
            return "/categories"
        case.getGroceries(let categoryId):
            return "/categories/\(categoryId)"
        case.downloadThumbnailImage(let imageName):
            return "/thumbnail/show/\(imageName)"
        case.downloadImage(let imageName):
            return "/image/show/\(imageName)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return ["Content-Type" : "application/json"]
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    func body() throws -> Data? {
        switch (self) {
        case .getGroceryCategores, .getGroceries, .downloadThumbnailImage, .downloadImage:
            return nil
        }
    }
}
