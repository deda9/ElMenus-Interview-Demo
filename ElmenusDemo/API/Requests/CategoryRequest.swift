//
//  CategoryRequest.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper
import Dotzu


/*
 * Category netrok request extend from the general base
 */
public protocol CategoryRequestDelegate: NSObjectProtocol {
    
    func categoryRequestWillSend()
    
    func categoryRequestSucceeded(data: CategoryResponse?)
    
    func categoryRequestFailed()
    
    func categoryRequestEmptyResponse()
}

public class CategoryRequest: BaseRequest<CategoryResponse> {
    
    weak var delegate: CategoryRequestDelegate?

    public override init() {
        super.init()
    }
    
    public func getCategoryList() {
        delegate?.categoryRequestWillSend()
        getResponseObject(url: Utils.MENUS_URL, debugResponse: true)
    }
    
    override func onRequestSuccess(data: CategoryResponse?) {
        delegate?.categoryRequestSucceeded(data: data)
    }
    
    override func onRequestFail() {
        delegate?.categoryRequestFailed()
    }
    
    override func onEmptyResponse() {
        delegate?.categoryRequestEmptyResponse()
    }
}
