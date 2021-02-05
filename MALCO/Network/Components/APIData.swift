//
//  APIData.swift
//  MALCO
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

struct APIData<T: Decodable>: Decodable {
    
    var status: Bool?
    var message: String?
    var errors: Errors?
    var data: T?
}
