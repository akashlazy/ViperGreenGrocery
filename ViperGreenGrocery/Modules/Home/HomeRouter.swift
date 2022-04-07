//  3rd Step
//  HomeRouter.swift
//  ViperBasicArchitecture
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation
import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension HomeRouter: HomeRouting {
    
}
