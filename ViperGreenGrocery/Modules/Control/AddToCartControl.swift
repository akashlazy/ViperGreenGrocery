//
//  AddToCartControl.swift
//  MVVMAddToCart
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import UIKit

typealias CartClosure = ((skuid: String, stepValue: Int)) -> ()

class AddToCartControl: UIControl, ViewLoadable {
    
    static var nibName: String = "AddToCartControl"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    var closure: CartClosure?
    
    var viewModel: AddCartViewModel! {
        didSet {
            let isHidden = viewModel.showStepper
            self.addButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
        }
    }
    
    @IBAction func addToCard(_ sender: Any) {
        self.viewModel = self.viewModel.onAddToCart()
        self.closure?((viewModel.id, viewModel.stepValue))
    }
    @IBAction func incrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onIncrement()
        self.closure?((viewModel.id, viewModel.stepValue))
    }
    @IBAction func decrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onDecreament()
        self.closure?((viewModel.id, viewModel.stepValue))
    }
    
    func configure(usingViewModel viewModel: AddCartViewModel, cartClosure: @escaping CartClosure) {
        self.viewModel = viewModel
        addButton.setTitle(viewModel.title, for: .normal)
        self.closure = cartClosure
    }
}

struct AddCartViewModel {
    let id: String
    let title: String = "ADD TO CART"
    let stepValue: Int
    let showStepper: Bool
    
    init(id: String, stepValue: Int) {
        self.id = id
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddCartViewModel {
    
    func onAddToCart() -> AddCartViewModel {
        return AddCartViewModel(id: self.id, stepValue: self.stepValue + 1)
    }
    func onIncrement() -> AddCartViewModel {
        guard stepValue < 10 else { return self }
        return AddCartViewModel(id: self.id, stepValue: self.stepValue + 1)
    }
    func onDecreament() -> AddCartViewModel {
        guard stepValue > 0 else { return self }
        return AddCartViewModel(id: self.id, stepValue: self.stepValue - 1)
    }
}
