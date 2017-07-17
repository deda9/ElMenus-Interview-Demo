//
//  Utils.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static let MENUS_URL = "http://elmenus.getsandbox.com/menu"
    
    public static func isIPhone() -> Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    public static func isIPad() -> Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }

}
