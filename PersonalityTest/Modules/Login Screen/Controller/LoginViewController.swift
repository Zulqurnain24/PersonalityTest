//
//  LoginViewController.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var forgetPasswordButtonHolder: UIView!
    @IBOutlet weak var signUpButtonHolderView: UIView!
    @IBOutlet weak var loginButtonHolderView: UIView!
    @IBOutlet weak var enterPasswordHolderView: UIView!
    @IBOutlet weak var enterEmailHolderView: UIView!
    
    let emailTextfieldView = Bundle.main.loadNibNamed("TextfieldView", owner: self, options: nil)?.last as! TextfieldView
    let passwordTextfieldView = Bundle.main.loadNibNamed("TextfieldView", owner: self, options: nil)?.last as! TextfieldView
    let forgotPasswordButtonView = Bundle.main.loadNibNamed("ButtonView", owner: self, options: nil)?.last as! ButtonView
    let loginButtonView = Bundle.main.loadNibNamed("ButtonView", owner: self, options: nil)?.last as! ButtonView
    let signupButtonView = Bundle.main.loadNibNamed("ButtonView", owner: self, options: nil)?.last as! ButtonView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    func setupViews() {
        self.view.accessibilityIdentifier = "LoginViewController"
        emailTextfieldView.configure(placeholder: "Enter Email", withAccessibilityIdentifier: "emailTextfieldView", validityType: ValidityType.email)
        enterEmailHolderView.addSubview(emailTextfieldView)
        passwordTextfieldView.configure(placeholder: "Enter Password", withAccessibilityIdentifier: "passwordTextfieldView", validityType: ValidityType.password)
        enterPasswordHolderView.addSubview(passwordTextfieldView)
        
        loginButtonView.configure(title: "Login", withAccessibilityIdentifier: "loginButtonView")
        loginButtonView.buttonCallback = {
            
        }
        loginButtonHolderView.addSubview(loginButtonView)
        
        signupButtonView.configure(title: "Sign Up", withAccessibilityIdentifier: "signupButtonView")
        signupButtonView.buttonCallback = {
            
        }
        signUpButtonHolderView.addSubview(signupButtonView)
        
        forgotPasswordButtonView.configure(title: "Forgot Password?", withAccessibilityIdentifier: "forgotPasswordButtonView")
        forgetPasswordButtonHolder.addSubview(forgotPasswordButtonView)
    }
    
    func performSegueTo(route: Route) {
        performSegue(withIdentifier: route.rawValue, sender: nil)
    }
}
