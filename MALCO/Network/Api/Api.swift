//
//  Api.swift
//  MALCO
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

let API = Api(.development)

enum APIConfigurations: String {
    
    case development = "debug"
    case stage = "stage"
    case release = "release"
}

final class Api {
    
    let config: APIConfigurations
    
    var BASE_URL: String {
        switch config {
        case .development:
            return "https://api.MALCO.dev/"
        case .stage:
            return "https://api.MALCO.dev/"
        case .release:
            return "https://api.MALCO.dev/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
          
    // MARK:- SIGNIN
    
    let SERVICE_SIGNIN = "login"
    
    // MARK:- SIGNUP
    
    let SERVICE_SIGNUP = "signup"
}
