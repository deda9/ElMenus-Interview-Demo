//
//  Category.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 * Category model 
 */
public class Category: Mappable {
    
    var descriptionField : String?
    var id : Int?
    var name : String?
    var subCategory : [SubCategory]?
    
    required public init?(map: Map) {}
    
    public func mapping(map: Map){
        descriptionField <- map["description"]
        id               <- map["id"]
        subCategory      <- map["items"]
        name             <- map["name"]
    }
}
