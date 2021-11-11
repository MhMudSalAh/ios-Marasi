//
//  ProductService.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

extension Api {
    
    enum Products: ServiceProtocol {
        
        case all
        
        var path: String {
            switch self {
            case .all:
                return API.SERVICE_HOME_PRODUCTS
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .all:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .all:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .all:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .all:
                return nil
            }
        }
    }
}
