//
//  Content.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

class Content: NSObject, Codable {
    
    var id: Int? = 0
    var title: String?
    var type: String?
    var image: String?
    var color: String?
    var textColor: String?
    var focusPoint: String?
    var categories: [Category]?
    var products: [Product]?
    var brands: [Brand]?
    
    override init() {
        super.init()
    }
}

extension Content {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title = "heading"
        case type
        case image = "backgroundImage"
        case textColor
        case color = "backgroundColor"
        case focusPoint = "backgroundFocusPoint"
        case categories = "blocks"
        case products
        case brands
    }
}
