//
//  AlmofireRequestExtensions.swift
//  MSA
//
//  Created by Bassem Anwer on 7/5/17.
//  Copyright © 2017 AppTcom. All rights reserved.
//

import Alamofire
import Dotzu


/*
 * Simple extension for almofire request to debug it
 */
public extension Request{
    
    public func debugLog() -> Self {
        #if DEBUG
            Logger.info(" ===========  Request =========== " )
            Logger.info("Header", self.request?.allHTTPHeaderFields ?? "Empty Headers")
            Logger.info(self)
        #endif
        return self
    }
}
