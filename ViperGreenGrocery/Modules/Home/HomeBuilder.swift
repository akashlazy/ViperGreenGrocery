//  6th Step
//  HomeBuilder.swift
//  ViperBasicArchitecture
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation
import UIKit

class HomeBuilder {
    
    static func build(usingNavigationFatory factory: NavigationFactory) -> UINavigationController {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let interactor = HomeInteractor(service: StubService.shared, database: RealmDatabase.shared)
        let router = HomeRouter(view: view)
        
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
       
        return factory(view)
    }
}


