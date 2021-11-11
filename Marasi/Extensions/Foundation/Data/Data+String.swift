//
//  Data+String.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

extension Data {
    
    /**
     Converts a data object to an utf8 string.
     
     - returns: The utf8 string or nil
     */
    var utf8String: String {
        return String(decoding: self, as: UTF8.self)
    }
    
    mutating func appendString(string: String) {
        let data = string.data(using:.utf8)
        append(data!)
    }
}
