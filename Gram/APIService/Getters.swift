//
//  Getters.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 06/12/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import Foundation
import Alamofire

class categoryGetter{
let url = "http://localhost:3000/category/20"
var categoryResponse : Category?
func getCategories() -> Category{
    Alamofire.request(url, method: .get).validate().responseData  { (response: DataResponse<Data>) in
        let categoryResponse = response.map { data in
            // We assume an existing User(json: Any) initializer
            self.categoryResponse = try! Category(data: data)
        }
    }

    return self.categoryResponse!
}
}
