//
//  SignInPresenter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignInPresenter: SignInPresenterInterface {
    
    weak var view: SignInView?
    var router: SignInRouterInterface!
    var interactor: SignInInteractorInterface!
    
    func didClickecdSignIn(_ form: SignForm) {
        view?.showLoading()
        interactor.signIn(form)
    }
    
    func didClickSignUp(){
        router.presentSignUp()
    }
}
    
extension SignInPresenter: SignInInteractorOutput {
    func didSignIn(_ token: Token) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
        }
    }
    
    func didFailedSignIn(_ error: APIError) {
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
            break
        }
    }
}
