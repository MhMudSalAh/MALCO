//
//  URLRequest+Extension.swift
//  MALCO
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit
import SystemConfiguration

extension URLRequest {
    
    init(service: ServiceProtocol, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        httpMethod = service.method.rawValue
        
        /// Set the spasific headers which assigned by routes
        
        service.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        /// Set the generic headers which are global for any route
       
        addValue(APIHeader.applicationJson.rawValue, forHTTPHeaderField: APIHeader.accept.rawValue)
        
        /// Set user access token if it is exist
//        if let token = USER.token.get()?.access {
//            addValue("Bearer \(token)", forHTTPHeaderField: APIHeader.authorization.rawValue)
//        }

        /// Set the spasific body which assigned by routes
        
        guard let body = service.body else { return }
        guard let dic = (body as! Codable).asDictionary() else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: dic)
    }
}
