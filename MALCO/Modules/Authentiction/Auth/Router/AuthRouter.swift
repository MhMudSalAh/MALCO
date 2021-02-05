//
//  AuthRouter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class AuthRouter: AuthRouterInterface {
    
    weak var viewController: UIViewController?
        
    func presentSignIn() {
        let vc = SignInRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentSignUp() {
        let vc = SignUpRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    static func assembleModule() -> UIViewController {
        let view: AuthController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "AuthController") as! AuthController
        
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        let router = AuthRouter()
        
        let navigation = NavController(rootViewController: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return navigation
    }
}
