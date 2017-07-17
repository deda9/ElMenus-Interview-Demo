//
//  UIButtonExtensions.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit
import Cartography

public extension UIButton {
    
    //MARK: Layout Constraints
    func cellMenuItemLikeButtonConstraintsLayout() {
        constrain(self) { button in
            button.left == button.superview!.left + 15
            button.bottom == button.superview!.bottom - 5
            button.height == 25
        }
    }
    
    //MARK: Styles
    func cellMenuItemLikeButtonStyle(){
        backgroundColor = UIColor.menuItemLikeButton()
        layer.cornerRadius = 20
        titleLabel?.textColor = UIColor.white
        setTitle("Like", for: .normal)
    }
    
}
