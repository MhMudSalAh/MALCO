//
//  AuthController.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit
import SkeletonView

class AuthController: BaseController {
        
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    var presenter: AuthPresenterInterface!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    func setupView() {
        lblWelcome.text = localizedText("welcome")
        btnSignIn.setTitle(localizedText("signIn"), for: .normal)
        btnSignUp.setTitle(localizedText("signUp"), for: .normal)
    }
    
    @IBAction func SignInAction(_ sender: Any) {
        presenter.didClickSignIn()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        presenter.didClickSignUp()
    }
}

extension AuthController: AuthView {
    
    func showLoading() {
        view.showAnimatedGradientSkeleton()
    }
    
    func hideLoading() {
        endRefresher()
        view.hideSkeleton()
    }
    
    func presentNetworkErrorScreen() {
        showNetworkErrorScreen(nil, self.view)
    }
    
    func hideNetworkErrorScreen() {
        closeNetworkErrorScreen()
    }
}

