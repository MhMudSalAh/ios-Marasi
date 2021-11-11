//
//  Meta.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

class Meta: NSObject, Codable {
    
    var current: Int?
    var perPage: Int?
    var total: Int?
    
    override init() {
        super.init()
    }
}

extension Meta {
    
    enum CodingKeys: String, CodingKey {
        
        case current = "pageNumber"
        case perPage = "pageLimit"
        case total = "totalPages"
    }
}
