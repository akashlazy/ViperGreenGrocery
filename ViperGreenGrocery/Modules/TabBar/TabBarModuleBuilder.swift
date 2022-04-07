//
//  TabBarModuleBuilder.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import UIKit

class TabBarModuleBuilder {
    static func build(usingSubModules subModules: TabBarRouter.SubModules) -> UITabBarController {
        
        let tabs = TabBarRouter.tabs(usingSubModules: subModules)
        let interactor = TabBarInteractor(database: RealmDatabase.shared)
        let presenter = TabBarPresenter(interactor: interactor)
        let tabBarController = GroceryTabBarController(tabs: tabs, presenter: presenter)
        presenter.view = tabBarController
        return tabBarController
    }
}
