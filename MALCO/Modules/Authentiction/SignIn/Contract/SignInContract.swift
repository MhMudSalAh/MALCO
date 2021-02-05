//
//  SignInContract.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

protocol SignInView: class {
    var presenter: SignInPresenterInterface! { get set }
    
    func showLoading()
    func hideLoading()
}

protocol SignInPresenterInterface: class {
    var view: SignInView? { get set }
    var router: SignInRouterInterface! { get set }
    var interactor: SignInInteractorInterface! { get set }
    
    func didClickecdSignIn(_ form: SignForm)
    func didClickSignUp()
}

protocol SignInInteractorInterface: class {
    var output: SignInInteractorOutput! { get set }
    
    func signIn(_ form: SignForm)
}

protocol SignInInteractorOutput: class {
    
    func didSignIn(_ token: Token)
    func didFailedSignIn(_ error: APIError)
}

protocol SignInRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentSignUp()
    
    static func assembleModule() -> UIViewController
}
