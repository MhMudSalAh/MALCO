//
//  SplashContract.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

protocol SplashView: class {
    var presenter: SplashPresenterInterface! { get set }
}

protocol SplashPresenterInterface: class {
    var view: SplashView? { get set }
    var interactor: SplashInteractorInteface! { get set }
    var router: SplashRouterInterface! { get set }
    
    func viewDidLoad()
}

protocol SplashInteractorInteface: class {
        
    var output: SplashInteractorOutput! { get set }
}

protocol SplashInteractorOutput: class {

}

protocol SplashRouterInterface: class {
    
    var viewController: UIViewController? { get set }
    
    func presentHome()
    
    static func assembleModule() -> UIViewController
}

