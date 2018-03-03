//
//  DTOBranch.swift
//  Restos
//
//  Created by Nina Yousefi on 2/28/18.
//  Copyright © 2018 Nina Yousefi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DTOBranch {
    
    var id:             Int64?
    var nameFn:           String?
    var nameEn:           String?
    var address:       String?
    var logoUrl:         String?
    //var cuisines:  //
    var rank:           Int64?
    //var deliveryMethods: //
    var state:          String?
    var distance:       Double?
    
    init(jsonDictionary: [String : JSON]?) {
        // super.init()
        
        guard let dictionary = jsonDictionary else {
            return
        }
        
        mapping(jsonDictionary: dictionary)
    }
    
    func mapping(jsonDictionary : [String : JSON]) {
        
        id = jsonDictionary["id"]?.int64Value
        nameFn = jsonDictionary["name_fa"]?.stringValue
        nameEn = jsonDictionary["name_en"]?.stringValue
        address = jsonDictionary["address"]?.stringValue
        logoUrl = jsonDictionary["logo_url"]?.stringValue
        rank = jsonDictionary["rank"]?.int64Value
        state = jsonDictionary["state"]?.stringValue
        distance = jsonDictionary["distance"]?.doubleValue
        
        
    }
}
