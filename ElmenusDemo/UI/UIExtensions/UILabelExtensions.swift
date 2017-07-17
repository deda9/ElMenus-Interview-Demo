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
            title.left == title.superview!.left
            title.right == title.superview!.right
            title.top == title.superview!.top
        }
    }
    
    func cellMenuItemDescriptionConstraintsLayout(topParent: UILabel, bottomParent: UIButton) {
        constrain(self, topParent, bottomParent) { title, topParent, bottomParent in
            title.left == title.superview!.left
            title.right == title.superview!.right
            title.bottom == bottomParent.top
            title.top == topParent.bottom + ( Utils.isIPhone() ? 10 : 20 )
        }
    }
    
    
    //MARK: Styles
    func cellMenuItemTitleStyle(){
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
