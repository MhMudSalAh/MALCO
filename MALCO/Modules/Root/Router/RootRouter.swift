//
//  RootRouter.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class RootRouter: RootRouterInterface {
        
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = SplashRouter.assembleModule()
    }
        
    func rootVC(_ vc: UIViewController) {
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc
    }
}
