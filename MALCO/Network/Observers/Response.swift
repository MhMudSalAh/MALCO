//
//  Response.swift
//  MALCO
//
//  Created by MhMuD SalAh on 11/16/20.
//

enum Response<T> {

    case onSuccess(T)
    case onFailure(APIError)
    case onCompleted
}
