//
//  Status.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

struct Status: Codable {
    
    var success: Bool
    var code : Int
    var message: String
}

extension Status {
    
    enum CodingKeys: String, CodingKey {
        
        case success
        case code
        case message
    }
}
