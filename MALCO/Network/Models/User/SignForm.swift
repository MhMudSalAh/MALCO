//
//  signForm.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import Foundation

struct SignForm: Codable {
    
    var username: String?
    var email: String
    var password: String
    var confirmPassword: String?
    var phone: String?
}

extension SignForm {
        
    enum CodingKeys: String, CodingKey {
        
        case username
        case email
        case password
        case confirmPassword = "password_confirmation"
        case phone
    }
}
