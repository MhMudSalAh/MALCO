//
//  UsersRepository.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

let USER = UsersRepository.shared
    
class UsersRepository: Repo {
        
    static let shared = UsersRepository()
    
        
    func signIn(_ form: SignForm, _ completion: @escaping (Response<Token>) -> ()) {
        provider.request(type: Token.self, service: Api.Users.signIn(form)) { response in
            switch response {
            case let .success(token):
                completion(.onSuccess(token))
                break
            case let .failure(error):
                completion(.onFailure(error))
                break
            case .complete:
                completion(.onCompleted)
                break
            }
        }
    }
  
    func signUp(_ form: SignForm, _ completion: @escaping (Response<Token>) -> ()) {
        provider.request(type: Token.self, service: Api.Users.signUp(form)) { response in
            switch response {
            case let .success(token):
                completion(.onSuccess(token))
                break
            case let .failure(error):
                completion(.onFailure(error))
                break
            case .complete:
                completion(.onCompleted)
                break
            }
        }
    }
}

