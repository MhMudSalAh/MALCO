//
//  SignUpRouter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignUpRouter: SignUpRouterInterface {
    
    weak var viewController: UIViewController?
        
    func presentSignIn() {
        let vc = SignInRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func assembleModule() -> UIViewController {
        
        let view: SignUpController = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        let interactor = SignUpInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
