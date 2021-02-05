//
//  SplashPresenter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SplashPresenter: SplashPresenterInterface {

    weak var view: SplashView?
    var interactor: SplashInteractorInteface!
    var router: SplashRouterInterface!
    var willRedirectToHome: Bool!
    
    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.router.presentHome()
        }
    }
}

extension SplashPresenter: SplashInteractorOutput {

}


