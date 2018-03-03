//
//  BranchService.swift
//  Restos
//
//  Created by Nina Yousefi on 2/28/18.
//  Copyright © 2018 Nina Yousefi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol BranchServiceDelegate {
    func getBranchesList_Success(serviceResult: AnyObject)
    func getBranchesList_Fail(error: Error?)
}

class BranchService: BaseService {
    
    var delegate: BranchServiceDelegate? = nil
    //var manager: DSAPIManager?
    
    init(controller: AnyObject) {
        self.delegate = controller as? BranchServiceDelegate
        super.init()
    }
    func getMovies() {
        
        let urlString = "\(ApiConstants.ApiUrl)public-api/v1/listings/by-coordinates?lng=51.4100159&lat=35.7574681"
        
        let headers = Alamofire.SessionManager.defaultHTTPHeaders
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            debugPrint(response)
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value {
                    
                    if let result = DTOBranchList.jsonToBranchList(data) {
                        self.delegate?.getBranchesList_Success(serviceResult: result)
                    }
                }
                break
            case .failure(_):
                self.delegate?.getBranchesList_Fail(error: response.result.error)
                break
                
            }
            
        }
    }
}





