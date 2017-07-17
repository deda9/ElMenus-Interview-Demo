//
//  ResturantViewModel.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation

class ResturantViewModel: NSObject{
    
    public func getCategoryList(_ delegate: CategoryRequestDelegate ) {
        let coordinator = APICoordinator();
        coordinator.getCategoryList(delegate);
    }
}
