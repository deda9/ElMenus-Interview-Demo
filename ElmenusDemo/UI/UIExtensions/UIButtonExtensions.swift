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
            button.left == button.superview!.left + 10
            button.bottom == button.superview!.bottom - 5
            button.height == 25
            button.width == 80
        }
    }
    
    func expandCollapseButtonLayoutConstraints() {
        constrain(self) { button in
            button.right == button.superview!.right -  10
            button.centerY == button.superview!.centerY
            button.height == 25
            button.width == 80
        }
    }
    
    //MARK: Styles
    func cellMenuItemLikeButtonStyle(){
        backgroundColor = UIColor.menuItemLikeButton()
        layer.cornerRadius = 10
        titleLabel?.textColor = UIColor.white
        setTitle("Like", for: .normal)
    }
    
}
