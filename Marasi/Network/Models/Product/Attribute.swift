//
//  Attribute.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit

class Attribute: NSObject, Codable {
    
    var id: Int?
    var currency: String?
    var oldPrice: Double?
    var price: Double?
    var discount: Float?
    var discountType: String?
    var badge: String?
    var badgeColor: String?
    var badgeTextColor: String?

    override init() {
        super.init()
    }
        
}

extension Attribute {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case currency
        case oldPrice = "price"
        case price = "salePrice"
        case discount = "saleAmount"
        case discountType = "saleType"
        case badge
        case badgeTextColor
        case badgeColor = "badgeBackground"
    }
}
