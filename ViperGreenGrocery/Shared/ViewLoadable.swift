//
//  ViewLoadable.swift
//  MVVMAddToCart
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

public protocol ViewLoadable: AnyObject {
    static var nibName: String { get }
}

public extension ViewLoadable {
    static func loadFromNib() -> Self {
        return loadFromNib(from: Bundle.init(for: self))
    }
    
    static func loadFromNib(from bundle: Bundle) -> Self {
        return bundle.loadNibNamed(self.nibName, owner: nil)?.first as! Self
    }
}
