//
//  SignUpResponse.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import Foundation

struct SignUpResponse: Codable {
    
    var token: String?
    var username: String?
}

extension SignUpResponse {
    
    enum CodingKeys: String, CodingKey {
        
        case token
        case username
    }
}

