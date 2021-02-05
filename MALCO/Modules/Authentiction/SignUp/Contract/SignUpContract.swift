//
//  SignUpContract.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

protocol SignUpView: class {
    var presenter: SignUpPresenterInterface! { get set }
    var email: String { get set }
    
    func showLoading()
    func hideLoading()
}

protocol SignUpPresenterInterface: class {
    var view: SignUpView? {get set}
    var interactor: SignUpInteractorInterface! { get set }
    var router: SignUpRouterInterface! { get set }
    
    func didClickecdSignUp(_ form: SignForm)
    func didClickSignIn()
}

protocol SignUpInteractorInterface: class {
    var output: SignUpInteractorOutput? { get set }
    
    func signUp(_ form: SignForm)
}

protocol SignUpInteractorOutput: class {

    func didSignUp(_ token: Token)
    func didFailedSignUp(_ error: APIError)

}

protocol SignUpRouterInterface: class {
    
    var viewController: UIViewController? { get set }
    
    func presentSignIn()
    
    static func assembleModule() -> UIViewController
}
