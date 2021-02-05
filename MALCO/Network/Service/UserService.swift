//
//  UserService.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import Foundation

extension Api {
    
    enum Users: ServiceProtocol {
        
        case signIn(_ form: SignForm)
        case signUp(_ form: SignForm)
        
        var path: String {
            switch self {
            case .signIn:
                return API.SERVICE_SIGNIN
            case .signUp:
                return API.SERVICE_SIGNUP
            
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .signIn:
                return .GET
            case .signUp:
                return .POST
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .signIn:
                return nil
            case .signUp:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .signIn:
                return nil
            case .signUp:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case let .signIn(form):
                return form
            case let .signUp(form):
                return form
            }
        }
    }
}


