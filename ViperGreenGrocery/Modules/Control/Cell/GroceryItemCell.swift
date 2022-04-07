//
//  GroceryItemCell.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/6/22.
//

import UIKit

class GroceryItemCell: UITableViewCell {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var cartControlView: UIView!
    
    lazy var cartControl: AddToCartControl = {
        let control = AddToCartControl.loadFromNib()
        return control
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cartControlView.addSubview(cartControl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(usingViewModel vm: GroceryItemViewModel, addToCartClouser: @escaping CartClosure)  {
        self.lblTitle.text = vm.title
        self.lblDesc.text = vm.description
        self.lblPrice.text = vm.price
        self.imgView.image = UIImage(named: vm.image)
        self.cartControl.configure(usingViewModel: vm.cartValue, cartClosure: addToCartClouser)
        self.selectionStyle = .none
    }
}
