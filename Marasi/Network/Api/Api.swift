//
//  Api.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

let API = Api(.development)

enum APIConfigurations: String {
    
    case development = "debug"
    case stage = "stage"
    case release = "release"
}

final class Api {
    
    let config: APIConfigurations
    
    var BASE_URL: String {
        switch config {
        case .development:
            return "http://178.128.171.40/task/"
        case .stage:
            return "http://178.128.171.40/task/"
        case .release:
            return "http://178.128.171.40/task/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
        
    // MARK:- PRODUCT
    
    let SERVICE_HOME_PRODUCTS = "response.json"

}
