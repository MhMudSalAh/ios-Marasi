//
//  Category.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

class Category: NSObject, Codable {
    
    var id: Int?
    var title: String?
    var type: String?
    var image: String?
    var imageCirle: String?
    var color: String?
    var textColor: String?
    
    override init() {
        super.init()
    }
}

extension Category {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case type
        case image = "blockImage"
        case imageCirle = "image"
        case color = "blockBackgroundColor"
        case textColor
    }
}
