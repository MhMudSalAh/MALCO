//
//  SignInRouter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignInRouter: SignInRouterInterface {

    weak var viewController: UIViewController?
    
    func presentSignUp() {
        let vc = SignUpRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    
    static func assembleModule() -> UIViewController {
        
        let view: SignInController = UIStoryboard(name: "SignIn", bundle: nil).instantiateViewController(withIdentifier: "SignInController") as! SignInController
        
        let presenter = SignInPresenter()
        let router = SignInRouter()
        let interactor = SignInInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
