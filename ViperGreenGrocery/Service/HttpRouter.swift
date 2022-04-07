//
//  HTTPRouter.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import Foundation
import Alamofire

protocol HttpRouter: URLRequestConvertible {
    var baseURLString: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    func body() throws -> Data?
}

extension HttpRouter {
    
    var parameter: Parameters? { return nil }
    func body() throws -> Data? { return nil }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseURLString.asURL()
        url.appendPathComponent(path)
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }
    
    func request(using service: HttpService) throws -> DataRequest {
        return try service.request(asURLRequest())
    }
}
