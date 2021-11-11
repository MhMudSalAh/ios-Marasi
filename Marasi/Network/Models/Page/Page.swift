//
//  Page.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

class Page<T: Codable>: NSObject, Codable {
    
    var meta: Meta? = Meta()
    var data: T?
    
    override init() {
        super.init()
    }
}

extension Page {
    
    enum CodingKeys: String, CodingKey {
        
        case data = "banners"
        case meta
    }
}
