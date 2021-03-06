//  2nd Step
//  HomePresentor.swift
//  ViperBasicArchitecture
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
    func onAddToCart(skuItem: SkuItem)
}

class HomePresenter {
    
    weak var view: HomeView?
    var router: HomeRouting
    var interactor: HomeUseCase
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    
    func onAddToCart(skuItem: SkuItem) {
        DispatchQueue.global(qos: .background).async {
            let updated = self.interactor.addToCart(skuItem: skuItem)
            debugPrint("Updated with result=(\(updated)")
        }
    }
    
    func viewDidLoad() {
        self.interactor.getGroceries { result in
            let groceryList = result.groceries.compactMap { grocery -> GroceryItemViewModel in
                let cartItem = self.interactor.getCartItem(skuId: grocery.id)
                return GroceryItemViewModel(using: grocery, cartItem: cartItem)
            }
            self.view?.updateGroceries(groceryList: groceryList)
        }
    }
}

struct GroceryItemViewModel {
    let id: String
    let title: String
    let image: String
    let description: String
    let price: String
    let cartValue: CartValueViewModel
    
    init(using groceryModel: Grocery, cartItem: CartItem) {
        self.id = groceryModel.id
        self.title = groceryModel.title
        self.image = groceryModel.image
        self.description = groceryModel.description
        self.price = "$ \(groceryModel.price)"
        self.cartValue = CartValueViewModel(id: cartItem.skuid, stepValue: cartItem.value)
    }
}
