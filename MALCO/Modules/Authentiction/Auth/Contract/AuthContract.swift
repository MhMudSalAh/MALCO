//
//  AuthContract.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

protocol AuthView: class {
    var presenter: AuthPresenterInterface! { get set }
    
    func showLoading()
    func hideLoading()
    
    func presentNetworkErrorScreen()
    func hideNetworkErrorScreen()
}

protocol AuthPresenterInterface: class {
    var view: AuthView? { get set }
    var router: AuthRouterInterface! { get set }
    var interactor: AuthInteractorInterface! { get set }
    
    func didClickSignIn()
    func didClickSignUp()
}

protocol AuthInteractorInterface: class {
    var output: AuthInteractorOutput! { get set }
    
}

protocol AuthInteractorOutput: class {
    
}

protocol AuthRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentSignIn()
    func presentSignUp()
    
    static func assembleModule() -> UIViewController
}
