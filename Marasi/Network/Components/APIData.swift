//
//  APIData.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

struct APIData<T: Decodable>: Decodable {
    
    var status: Status
    var errors: Errors?
    var data: T?
}
