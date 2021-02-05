//
//  AuthPresenter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class AuthPresenter: AuthPresenterInterface {
    
    weak var view: AuthView?
    var router: AuthRouterInterface!
    var interactor: AuthInteractorInterface!
        
    func didClickSignIn() {
        router.presentSignIn()
    }
    
    func didClickSignUp() {
        router.presentSignUp()
    }

}

extension AuthPresenter: AuthInteractorOutput {
    
    func checkError(_ error: APIError) {
        switch error.type {
        case .network:
            self.view?.presentNetworkErrorScreen()
            break
        default:
            if error.message != nil {
                
            }
            break
        }
    }
    
}
