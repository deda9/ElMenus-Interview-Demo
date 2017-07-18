//
//  FakeResponse.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/18/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation

/**
 *
 * Cuase the server is fail too much,
 * so I had to make this class to test it like the response which back from the server
 */

class FakeResponse: NSObject {
    var categoriesList : [CategoryFake] = []
    
    func setCategoriesList() -> [CategoryFake]{
        categoriesList.append(getCat1())
        categoriesList.append(getCat2())
        categoriesList.append(getCat3())
        return categoriesList
    }
    
    func getCat1() -> CategoryFake {
        var cat1 = CategoryFake()
        cat1.setFakeSubCategory()
        cat1.setName()
        return cat1
    }
    
    func getCat2() -> CategoryFake {
        var cat2 = CategoryFake()
        cat2.setFakeSubCategory()
        cat2.setName()
        return cat2
    }
    
    func getCat3() -> CategoryFake {
        var cat3 = CategoryFake()
        cat3.setFakeSubCategory()
        cat3.setName()
        return cat3
    }
}

public class CategoryFake: NSObject{
    
    var descriptionField : String?
    var id : Int?
    var name : String?
    var subCategory: [SubCategoryFake] = []

    func setFakeSubCategory(){
        subCategory.append(getSubCat1())
        subCategory.append(getSubCat2())
        subCategory.append(getSubCat3())
    }
    
    func getSubCat1() -> SubCategoryFake {
        let cat1 = SubCategoryFake()
        cat1.setName()
        cat1.setDescriptionField()
        return cat1
    }
    
    func getSubCat2() -> SubCategoryFake {
        let cat2 = SubCategoryFake()
        cat2.setName()
        cat2.setDescriptionField()
        return cat2
    }
    
    func getSubCat3() -> SubCategoryFake {
        let cat3 = SubCategoryFake()
        cat3.setName()
        cat3.setDescriptionField()
        return cat3
    }
    
    func setName(){
        name = "Fake Cate"
    }
}


public class SubCategoryFake: NSObject{
    
    var descriptionField : String?
    var id : Int?
    var name : String?
    
    func setName(){
        name = "Fake Cate"
    }
    
    func setDescriptionField(){
        descriptionField = "Fake Cate descriptionField"
    }
}



