//
//  APIError.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

enum APIErrorType {

    case server
    case noData
    case parsing
    case string
    case network
    case known
}

struct APIError {
    
    var code: Int? = 0
    var message: String?
    var errors: Errors?
    var type: APIErrorType
}


struct Errors: Codable {
    
    var username: [String]?
    var email: [String]?
    var phone: [String]?
    var password: [String]?
    var buildingNo: [String]?
    var region: [String]?
    var city: [String]?
    var address: [String]?
    var street: [String]?
    var floorNo: [String]?
    var apartmentNo: [String]?
}

extension Errors {
    
    enum CodingKeys: String, CodingKey {
        
        case username
        case email
        case phone
        case password
        case buildingNo = "building_number"
        case floorNo = "floor_number"
        case apartmentNo = "apartment_number"
        case region
        case city
        case address
        case street
    }
}
