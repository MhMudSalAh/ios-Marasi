//
//  AppDelegate.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import Foundation

open class Console {
    
    static func logAPI(_ url: String, _ headers: [String:String], _ body: Any, _ statusCode: Int, _ response: String, _ error: Error?) {
        LOG("⤴️Url", url)
        LOG("👉🏻Headers", headers)
        LOG("👉🏻Body", body)
        LOG("👉🏻Status Code", statusCode)
        LOG("⤵️Response", response)
        switch statusCode {
        case 200...299:
            LOG("👉🏻State: \(url.replacingOccurrences(of: API.BASE_URL, with: ""))", "🏆Success⏹")
            break
        default:
            LOG("👉🏻State: \(url.replacingOccurrences(of: API.BASE_URL, with: ""))", "🔥Error: \(String(describing: error))⏹")
            break
        }
    }
    
    static func logError(_ type: APIErrorType) {
        Console.LOG("🔥Error", "\(type)")
    }
    
    static func LOG(_ tag: String, _ text: Any) {
        #if DEBUG
        print("\(tag): \(text)")
        #endif
    }
}
