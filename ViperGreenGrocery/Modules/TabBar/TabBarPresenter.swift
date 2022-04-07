//
//  TabBarPresenter.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import Foundation

protocol TabBarPresentation {
    func viewDidLoad()
}

class TabBarPresenter {
    weak var view: TabBarView?
    let interactor: TabBarUseCase
    
    init(interactor: TabBarInteractor) {
        self.interactor = interactor
    }
}

extension TabBarPresenter: TabBarPresentation {
    func viewDidLoad() {
        interactor.getCartCount { count in
            self.view?.updateCartCount(count: count)
        }
    }
}
