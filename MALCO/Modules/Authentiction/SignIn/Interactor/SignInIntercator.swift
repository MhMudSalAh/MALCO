//
//  SignInIntercator.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignInInteractor: SignInInteractorInterface {
    
    var output: SignInInteractorOutput!
    
    func signIn(_ form: SignForm) {
        USER.signIn(form) { response in
            switch response {
            case let .onSuccess(token):
                self.output.didSignIn(token)
                return
            case let .onFailure(error):
                self.output.didFailedSignIn(error)
                return
            default:
                break
            }
        }
    }
}
