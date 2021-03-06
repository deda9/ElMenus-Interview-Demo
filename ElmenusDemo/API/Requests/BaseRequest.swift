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
 * Base netwrok request which used in all the operations
 */
public class BaseRequest<T: Mappable>: NSObject {
    
    var sessionManager: SessionManager?
    
    public override init() {
        super.init()
        addDebuggerConfiguration()
    }
    
    private func addDebuggerConfiguration() {
        let configuration = URLSessionConfiguration.default
        Dotzu.sharedManager.addLogger(session: configuration)
        sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    public func getResponseObject(url: String, debugResponse: Bool = true) {
        sessionManager?.request(url, method: getMethodType(), parameters: getParameters(), headers: getHeaders())
            .debugLog()
            .responseObject(completionHandler: { (response: DataResponse<T>) in
                
                if debugResponse {
                    Logger.info(response)
                }
                
                weak var weakSelf = self
                
                switch response.result {
                case .success:
                    
                    guard let successResponse:T = response.result.value else {
                        weakSelf?.onEmptyResponse()
                        break
                    }
                    
                    weakSelf?.onRequestSuccess(data: successResponse)
            
                    
                case .failure:
                    weakSelf?.onRequestFail()
                }
            })
    }
    
    func getMethodType() -> HTTPMethod {
        return .get
    }
    
    func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        return headers
    }
    
    func getParameters() -> Parameters? {
        return nil
    }
    
    func onRequestSuccess(data: T?) {
        preconditionFailure("Override onRequestSuccess func -> BaseLoginRequest")
    }
    
    func onEmptyResponse() {
    }
    
    func onRequestFail() {
        preconditionFailure("Override onRequestFail func -> BaseLoginRequest")
    }
}
