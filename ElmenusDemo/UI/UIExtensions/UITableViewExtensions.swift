//
//  UITableViewExtensions.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/18/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import Cartography

public extension UITableView {
    
    func menusTableLayoutConstraints() {
        constrain(self) { tableView in
            tableView.edges == tableView.superview!.edges
        }
    }
}
