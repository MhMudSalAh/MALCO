//
//  SignUpPresenter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignUpPresenter: SignUpPresenterInterface {
    
    var view: SignUpView?
    var interactor: SignUpInteractorInterface!
    var router: SignUpRouterInterface!
    
    func didClickecdSignUp(_ form: SignForm) {
        view?.showLoading()
        interactor.signUp(form)
    }
    
    func didClickSignIn(){
        router.presentSignIn()
    }
}

extension SignUpPresenter: SignUpInteractorOutput {
    
    func didSignUp(_ token: Token) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
        }
    }
    
    func didFailedSignUp(_ error: APIError) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.checkError(error)
        }
    }
    
    func checkError(_ error: APIError) {
        switch error.type {
        case .network:
            break
        default:
            if error.message != nil {
                
            }
            break
        }
    }
}
