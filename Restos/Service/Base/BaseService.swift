//
//  BaseService.swift
//  Restos
//
//  Created by Nina Yousefi on 2/28/18.
//  Copyright © 2018 Nina Yousefi. All rights reserved.
//
import Foundation
class BaseService: NSObject {
    
    func defaultDigistyleRequest() -> NSMutableURLRequest? {
        
        let baseRequest = NSMutableURLRequest()
        
        baseRequest.timeoutInterval = 15
        baseRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // baseRequest.setValue(ApiConstants.ApplicationType, forHTTPHeaderField: "ApplicationType")
        //   baseRequest.setValue(ApiConstants.StoreFrontType, forHTTPHeaderField: "StoreFrontType")
        baseRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        baseRequest.httpShouldHandleCookies = true
        
        return baseRequest
    }
    
}

