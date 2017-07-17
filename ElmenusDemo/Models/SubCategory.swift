//
//  SubCategory.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import ObjectMapper

public class SubCategory: Mappable {
    
    var descriptionField : String?
    var id : Int?
    var name : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map){
        descriptionField <- map["description"]
        id               <- map["id"]
        name             <- map["name"]
    }
}
