//
//  ProfileMouleBuilder.swift
//  ViperGreenGrocery
//
//  Created by Akash Arun Jambhulkar (Digital) on 4/7/22.
//

import UIKit

class ProfileMouleBuilder {
    static func build(usingNavFactory factory: NavigationFactory) -> UIViewController{
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        return factory(view)
    }
}
