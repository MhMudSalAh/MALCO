//
//  SignUpInteractor.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignUpInteractor: SignUpInteractorInterface {
    
    weak var output: SignUpInteractorOutput?
    
    func signUp(_ form: SignForm) {
        USER.signUp(form){ response in
            switch response {
            case let .onSuccess(token):
                self.output?.didSignUp(token)
                return
            case let .onFailure(error):
                self.output?.didFailedSignUp(error)
                return
            default:
                break
            }
        }
    }
}
