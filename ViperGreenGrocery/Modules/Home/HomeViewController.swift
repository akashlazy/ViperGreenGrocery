//  1st Step
//  ViewController.swift
//  ViperBasicArchitecture
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import UIKit

protocol HomeView: AnyObject {
    func updateGroceries(groceryList: [GroceryItemViewModel])
}

class HomeViewController: UIViewController {
    
    static let groceryCellID = "GroceryItemCell"

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresentation?
    var datasource: [GroceryItemViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "GroceryItemCell", bundle: nil), forCellReuseIdentifier: HomeViewController.groceryCellID)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.presenter?.viewDidLoad()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.groceryCellID, for: indexPath) as? GroceryItemCell else {
            return UITableViewCell()
        }
        
        let groceryVM = datasource[indexPath.row]
        cell.configure(usingViewModel: groceryVM, addToCartClouser: { result in
            debugPrint("Cart Value added with skuid = \(result.skuid) and quantity = \(result.stepValue)")
            let skuItem: SkuItem = (skuid: result.skuid, quantity: result.stepValue)
            self.presenter?.onAddToCart(skuItem: skuItem)
        })
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: HomeView {
    
    func updateGroceries(groceryList: [GroceryItemViewModel]) {
        self.datasource = groceryList
    }
}

