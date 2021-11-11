//
//  Banner.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

class Banner: NSObject, Codable {
    
    var type: String? = ""
    var content: Content = Content()
    
    override init() {
        super.init()
    }
}

extension Banner {
    
    enum CodingKeys: String, CodingKey {
        
        case type
        case content
    }
}
