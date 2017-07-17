//
//  CategoryResponse.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import ObjectMapper

public class CategoryResponse: Mappable {

    var categoriesList : [Category]?

    required init?(map: Map) {}
    
    func mapping(map: Map){
        categoriesList <- map["categories"]
    }
}
