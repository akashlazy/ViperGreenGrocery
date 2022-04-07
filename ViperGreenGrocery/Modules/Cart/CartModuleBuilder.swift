//
//  CartModuleBuilder.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import Foundation
import UIKit

class CartModuleBuilder {
    static func build(usingNavFactory factory: NavigationFactory) -> UIViewController{
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        return factory(view)
    }
}
