//
//  APIResponse.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

enum APIResponse<T> {
    
    case success(T)
    case failure(APIError)
    case complete
}
