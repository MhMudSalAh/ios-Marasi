//
//  Brand.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

class Brand: NSObject, Codable {
    
    var id: Int?
    var category: Int?
    var image: String?
    
    override init() {
        super.init()
    }
}

extension Brand {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case category
        case image
    }
}
