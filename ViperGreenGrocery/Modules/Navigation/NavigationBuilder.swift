//
//  NavigationBuilder.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.barTintColor = .blue
        navigationController.navigationBar.tintColor = .white
        return navigationController
    }
}
