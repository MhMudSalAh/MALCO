//
//  ViewController.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignInController: BaseController {
    
    @IBOutlet weak var lblSignIn: UILabel!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var imgTogglePassword: UIImageView!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    
    var presenter: SignInPresenterInterface!
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        lblSignIn.text = localizedText("signIn")
        btnSignIn.setTitle(localizedText("signIn"), for: .normal)
        lblSignUp.text = localizedText("don't_have_account")
        btnSignUp.setTitle(localizedText("signUp"), for: .normal)
        
        togglePaswordTap()
        
        txtFldEmail.attributedPlaceholder = NSAttributedString(string: localizedText("email"),attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        
        txtFldPassword.attributedPlaceholder = NSAttributedString(string: localizedText("password"),attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        
        txtFldEmail.localize()
        txtFldPassword.localize()
        
        txtFldEmail.delegate = self
        txtFldPassword.delegate = self
        
        txtFldEmail.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        txtFldPassword.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    }
    
    @objc func togglePassword(_ sender: UIButton) {
        imgTogglePassword.isHighlighted = !imgTogglePassword.isHighlighted
        txtFldPassword.isSecureTextEntry = !imgTogglePassword.isHighlighted
    }
    
    func togglePaswordTap() {
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(togglePassword))
        gesture.numberOfTapsRequired = 1
        imgTogglePassword.isUserInteractionEnabled = true
        imgTogglePassword.addGestureRecognizer(gesture)
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        email = txtFldEmail.text ?? ""
        let form = SignForm(email: email, password: txtFldPassword.text ?? "")
        presenter.didClickecdSignIn(form)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        presenter.didClickSignUp()
    }
    
    @objc func handleTextInputChange() {

    }
}

extension SignInController: SignInView {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}

extension SignInController: UITextFieldDelegate {
    
    
}
