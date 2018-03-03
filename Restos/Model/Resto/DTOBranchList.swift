//
//  DTOBranchList.swift
//  Restos
//
//  Created by Nina Yousefi on 2/28/18.
//  Copyright © 2018 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOBranchList {
    
    var data:[DTOBranch]?
    
    init() {
        //super.init()
        
        data = [DTOBranch]()
    }
    
    
    
    class func jsonToDTOBranchList(_ responseObject: Dictionary<String, JSON> /*Dictionary<String, JSON>*/) -> DTOBranchList? {
        var result =  DTOBranchList()
        
        if let resultArray = responseObject["branches"]?.arrayValue, resultArray.count > 0 {
            let branchList = DTOBranchList()
            
            for item in resultArray {
                let obj :DTOBranch = DTOBranch(jsonDictionary:item.dictionary)
                branchList.data?.append(obj)
            }
            
            result = branchList
        }
        
        return result
    }
    
    class func jsonToBranchList(_ responseValue: Any) -> AnyObject? {
        
        let swiftyJson = JSON(responseValue)
        
        if let responseObject = swiftyJson.dictionary {
            print(responseObject)
            
                let result = jsonToDTOBranchList(responseObject)
                
                return result!
        
        }
        return nil
    }
}

