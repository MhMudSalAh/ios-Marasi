//
//  Product.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class Product: NSObject, Codable {
    
    var id: Int?
    var title: String?
    var image: String?
    var brand: String?
    var attributes: [Attribute]?

    func getDiscountType() -> String {
        if attributes?[0].discountType == "percent" {
            return "%"
        } else {
            return ""
        }
    }
    
    override init() {
        super.init()
    }
}

extension Product {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case image
        case brand
        case attributes = "variants"
    }
}
