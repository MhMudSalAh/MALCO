//
//  SignUpVC.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class SignUpController: BaseController {
        
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var imgTogglePassword: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var lblSignIn: UILabel!
    @IBOutlet weak var lblOr: UILabel!
    
    var presenter: SignUpPresenterInterface!
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
        
        togglePaswordTap()
        
        lblSignUp.text = localizedText("signUp")
        btnSignUp.setTitle(localizedText("signUp"), for: .normal)
        lblSignIn.text = localizedText("have_account")
        btnSignIn.setTitle(localizedText("signIn"), for: .normal)
        lblOr.text = localizedText("or")
        
        txtFldEmail.attributedPlaceholder = NSAttributedString(string: localizedText("email"),attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        
        txtFldPassword.attributedPlaceholder = NSAttributedString(string: localizedText("password"),attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        
        txtFldEmail.localize()
        txtFldPassword.localize()

        txtFldEmail.delegate = self
        txtFldPassword.delegate = self
                
        handleTextInputChange()
    }
    
    @objc func handleTextInputChange() {
//        if isValid(txtFldEmail.text, txtFldPassword.text) {
//            btnSignUp.isEnabled = true
//            btnSignUp.alpha = 1.0
//        } else {
//            btnSignUp.isEnabled = false
//            btnSignUp.alpha = 0.5
//        }
    }
    
    func isValid(_ email: String?, _ password: String?) -> Bool {
        if email?.isEmpty ?? true {
            return false
        } else if !VALID.isEmail(email) {
            return false
        } else if password?.isEmpty ?? true {
            return false
        } else if !VALID.isPassword(password) {
            return false
        }
        return true
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        email = txtFldEmail.text ?? ""
        let form = SignForm(email: email, password: txtFldPassword.text ?? "")
        presenter.didClickecdSignUp(form)
    }
    
    @IBAction func actionFacebook(_ sender: Any) {
        
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        presenter.didClickSignIn()
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
}

extension SignUpController: SignUpView {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
}

extension SignUpController: UITextFieldDelegate {
    
}

