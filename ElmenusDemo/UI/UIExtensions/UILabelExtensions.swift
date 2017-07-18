//
//  UILabelExtensions.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import Cartography

public extension UILabel {
    
    //MARK: Layout Constraints
    func cellMenuItemTitleConstraintsLayout() {
        constrain(self) { title in
            title.left == title.superview!.left + 10
            title.right == title.superview!.right - 10
            title.top == title.superview!.top + 10
        }
    }
    
    func cellCategoryTitleConstraintsLayout() {
        constrain(self) { title in
            title.left == title.superview!.left + ( Utils.isIPhone() ? 10 : 20 )
            title.right == title.superview!.right
            title.center == title.superview!.center
        }
    }
    
    func cellMenuItemDescriptionConstraintsLayout(topParent: UILabel, bottomParent: UIButton) {
        constrain(self, topParent, bottomParent) { description, topParent, bottomParent in
            description.left == description.superview!.left + 10
            description.right == description.superview!.right
            description.bottom == bottomParent.top - 20
            description.width == description.superview!.width - 20
            description.top == topParent.bottom + ( Utils.isIPhone() ? 10 : 20 )
        }
    }
    
    //MARK: Styles
    func cellMenuItemTitleStyle(){
        textColor = UIColor.black
        numberOfLines = 0
        textAlignment = .left
        
    }
    
    func cellCategoryTitleStyle(){
        textColor = UIColor.black
        numberOfLines = 0
        textAlignment = .left
    }
    
    func cellMenuItemDescriptionStyle(){
        textColor = UIColor.gray
        numberOfLines = 0
        textAlignment = .left
    }
}
