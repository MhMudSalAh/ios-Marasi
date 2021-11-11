//
//  URLRequest+Extension.swift
//  Marasi
//
//  Created by MhMuD SalAh on 10/11/2021.
//

import UIKit
import SystemConfiguration

extension URLRequest {
    
    init(service: ServiceProtocol, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        httpMethod = service.method.rawValue
        
        /// Set the generic headers which are global for any route
        
        addValue(APIHeader.applicationJson.rawValue, forHTTPHeaderField: APIHeader.accept.rawValue)
        addValue(APIHeader.ios.rawValue, forHTTPHeaderField: APIHeader.deviceOS.rawValue)
        addValue(APIHeader.applicationJson.rawValue, forHTTPHeaderField: APIHeader.contentType.rawValue)
        addValue(LOCAL.getLanguage(), forHTTPHeaderField: APIHeader.locale.rawValue)
        addValue(APIHeader.accessValue.rawValue, forHTTPHeaderField: APIHeader.accessKey.rawValue)
        
        if let uuid = UIDevice.current.identifierForVendor {
            addValue(uuid.uuidString, forHTTPHeaderField: APIHeader.deviceId.rawValue)
        }
        
        if let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String {
            addValue(appVersion, forHTTPHeaderField: APIHeader.applicationVersion.rawValue)
        }
        
        if let appBuild = Bundle.main.infoDictionary!["CFBundleVersion"] as? String {
            addValue(appBuild, forHTTPHeaderField: APIHeader.buildNumber.rawValue)
        }
        
//        /// Set user access token if it is exist
//        
//        if let token = USER.token.get()?.access {
//            addValue("Bearer \(token)", forHTTPHeaderField: APIHeader.authorization.rawValue)
//        }
        
        /// Set the spasific headers which assigned by routes
        
        service.headers?.forEach { key, value in
            setValue(value, forHTTPHeaderField: key)
        }
        
        /// Set the spasific body which assigned by routes
        
        guard let body = service.body else { return }
        if ((body as? Data) != nil) && service.method == .POST && (service.headers?.firstIndex(where: {$0.key == APIHeader.contentLenght.rawValue}) != nil) {
            httpBody = service.body as? Data
        } else {
            guard let dic = (body as! Codable).asDictionary() else { return }
            httpBody = try? JSONSerialization.data(withJSONObject: dic)
        }
    }
}
