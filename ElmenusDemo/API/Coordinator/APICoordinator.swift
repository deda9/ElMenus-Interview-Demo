//
//  APICoordinator.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation


/*
 * Coordinate all the operation for the network requests come from the ResturantViewModel
 */
class APICoordinator:NSObject {
    
    /*
     * get the list for the menus and take the delegate to back the reponse
     * create new request and ask it for the data
     */
    public func getCategoryList(_ delegate: CategoryRequestDelegate ) {
        let categoryRequest = CategoryRequest()
        categoryRequest.delegate = delegate
        categoryRequest.getCategoryList()
    }
    
}
