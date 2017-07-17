//
//  UIViewExtensions.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import Cartography

public extension UIView {
    
    func fillScreenLayoutConstrains() {
        constrain(self) { view in
            view.edges == view.superview!.edges
        }
    }
}
