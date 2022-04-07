//
//  GroceryTabBarViewController.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import UIKit

typealias GroceryTabs = (
    home: UIViewController,
    cart: UIViewController,
    profile: UIViewController
)

protocol TabBarView: AnyObject {
    func updateCartCount(count: Int)
}

class GroceryTabBarController: UITabBarController {
    
    var cartTab: UIViewController?
    var presenter: TabBarPresenter?
    
    init(tabs: GroceryTabs, presenter: TabBarPresenter) {
        self.cartTab = tabs.cart
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = [tabs.home, tabs.cart, tabs.profile]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter?.viewDidLoad()
    }
}

extension GroceryTabBarController: TabBarView {
    func updateCartCount(count: Int) {
        self.cartTab?.tabBarItem.badgeValue = count > 0 ? "\(count)" : nil
    }
}
