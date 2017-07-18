//
//  ResturantViewModel.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
/*
 * Handle all the opration which occur in ResturantViewController
 */
class ResturantViewModel: NSObject{
    
    /*
     * get the list of categories (menus) called from RestaurantViewController
     * and take delegate to back the response 
     */
    public func getCategoryList(_ delegate: CategoryRequestDelegate ) {
        let coordinator = APICoordinator();
        coordinator.getCategoryList(delegate);
    }
}
