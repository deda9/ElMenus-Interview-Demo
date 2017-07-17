//
//  RestuarantsViewController.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit

class RestuarantsViewController: BaseViewController {
    
    lazy var apiCoordinator = APICoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCatrgoryList()
    }
    
    private func getCatrgoryList(){
        apiCoordinator.getCategoryList(self)
    }
}

extension RestuarantsViewController: CategoryRequestDelegate{
    
    func categoryRequestWillSend(){
        
    }
    
    func categoryRequestSucceeded(data: [CategoryResponse]?){
        
    }
    
    func categoryRequestFailed(){
        
    }
    
    func categoryRequestEmptyResponse(){
        
    }

}
