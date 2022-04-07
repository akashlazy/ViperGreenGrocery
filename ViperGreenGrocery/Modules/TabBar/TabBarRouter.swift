//
//  TabBarRouter.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import UIKit
import SwiftUI

class TabBarRouter {
    
    var viewController: UIViewController
    var subModules: SubModules
    
    typealias SubModules = (
        home: UIViewController,
        cart: UIViewController,
        profile: UIViewController
    )
    
    init(viewController: UIViewController, subModules: SubModules) {
        self.viewController = viewController
        self.subModules = subModules
    }
}

extension TabBarRouter {
    static func tabs(usingSubModules subModules: SubModules) -> GroceryTabs {
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: ""), tag: 0)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: ""), tag: 1)
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: ""), tag: 2)
        
        subModules.home.tabBarItem = homeTabBarItem
        subModules.cart.tabBarItem = cartTabBarItem
        subModules.profile.tabBarItem = profileTabBarItem
        
        return (
            home: subModules.home,
            cart: subModules.cart,
            profile: subModules.profile
        )
    }
}
