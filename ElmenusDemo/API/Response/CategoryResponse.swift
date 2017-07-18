//
//  CategoryResponse.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import ObjectMapper


/*
 * the response model which back fromt the nework request
 */
public class CategoryResponse: Mappable {

    var categoriesList : [Category]?

    required public init?(map: Map) {}
    
    public func mapping(map: Map){
        categoriesList <- map["categories"]
    }
}
