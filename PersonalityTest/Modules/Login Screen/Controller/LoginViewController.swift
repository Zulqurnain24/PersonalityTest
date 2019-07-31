//
//  LoginViewController.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var personalityQuizButtonViewHolder: UIView!
    @IBOutlet weak var forgetPasswordButtonHolder: UIView!
    @IBOutlet weak var signUpButtonHolderView: UIView!
    @IBOutlet weak var loginButtonHolderView: UIView!
    @IBOutlet weak var enterPasswordHolderView: UIView!
    @IBOutlet weak var enterEmailHolderView: UIView!
    @IBOutlet weak var logOutButtonHolderView: UIView!
    
    let emailTextfieldView = Bundle.main.loadNibNamed(Nibs.textfieldView.rawValue, owner: self, options: nil)?.last as! TextfieldView
    let passwordTextfieldView = Bundle.main.loadNibNamed(Nibs.textfieldView.rawValue, owner: self, options: nil)?.last as! TextfieldView
    let forgotPasswordButtonView = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    let loginButtonView = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    let signupButtonView = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    let logOutButtonView = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    let personalityQuizButtonView = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    let alertView = Bundle.main.loadNibNamed(Nibs.alertView.rawValue, owner: self, options: nil)?.last as! AlertView
    
    var handle: AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkIfUserIsLoggedIn()
    }
    
    func checkIfUserIsLoggedIn() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // Handle authenticated state
            guard let _ = auth.currentUser as User? else {
                self.updateUI(isLoggedIn: false)
                return
            }
            self.updateUI(isLoggedIn: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func setupViews() {
        self.view.accessibilityIdentifier = AccessibilityIdentifier.loginViewController.rawValue
        emailTextfieldView.configure(placeholder: StringConstants.emailPlaceHolder.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.emailTextfieldView.rawValue, validityType: ValidityType.email)
        enterEmailHolderView.addSubview(emailTextfieldView)
        
        passwordTextfieldView.configure(placeholder: StringConstants.passwordPlaceHolder.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.passwordTextfieldView.rawValue, validityType: ValidityType.password)
        enterPasswordHolderView.addSubview(passwordTextfieldView)
        
        loginButtonView.configure(title: StringConstants.loginButtonTitle.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.loginButtonView.rawValue)
        loginButtonView.buttonCallback = {
            self.loginTapped()
        }
        loginButtonHolderView.addSubview(loginButtonView)
        
        signupButtonView.configure(title: StringConstants.signupButtonTitle.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.signupButtonView.rawValue)
        signupButtonView.buttonCallback = {
            self.signUpTapped()
        }
        signUpButtonHolderView.addSubview(signupButtonView)
        
        forgotPasswordButtonView.configure(title: StringConstants.forgetPasswordButtonTitle.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.forgotPasswordButtonView.rawValue)
        forgotPasswordButtonView.buttonCallback = {
            self.forgotPasswordTapped()
        }
        forgetPasswordButtonHolder.addSubview(forgotPasswordButtonView)
        
        logOutButtonView.configure(title: StringConstants.logOutButtonTitle.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.signOutButtonView.rawValue)
        logOutButtonView.buttonCallback = {
            self.logOutTapped()
        }
        logOutButtonHolderView.addSubview(logOutButtonView)
        
        personalityQuizButtonView.configure(title: StringConstants.personalityQuizButtonView.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.personalityQuizButtonView.rawValue)
        personalityQuizButtonView.buttonCallback = {
            self.performSegueTo(route: Route.segueToPersonalityTest)
        }
        personalityQuizButtonViewHolder.addSubview(personalityQuizButtonView)
    }
    
    func updateUI(isLoggedIn: Bool) {
        
        emailTextfieldView.textField.text = nil
        passwordTextfieldView.textField.text = nil
        
        guard isLoggedIn else {
            emailTextfieldView.isHidden = false
            passwordTextfieldView.isHidden = false
            forgotPasswordButtonView.isHidden = false
            loginButtonView.isHidden = false
            signupButtonView.isHidden = false
            logOutButtonView.isHidden = true
            alertView.isHidden = false
            personalityQuizButtonView.isHidden = true
            return
        }
        
        emailTextfieldView.isHidden = true
        passwordTextfieldView.isHidden = true
        forgotPasswordButtonView.isHidden = true
        loginButtonView.isHidden = true
        signupButtonView.isHidden = true
        logOutButtonView.isHidden = false
        alertView.isHidden = true
        personalityQuizButtonView.isHidden = false
    }
    
    func performSegueTo(route: Route) {
        performSegue(withIdentifier: route.rawValue, sender: nil)
    }

    func signUpTapped() {
        guard let emailText = emailTextfieldView.textField.text as String?, let passwordText = passwordTextfieldView.textField.text as String?, NetworkUtility.shared.isConnectedToInternet() else {
                self.alertView.setText(StringConstants.noConnectionToInternet.rawValue)
                self.alertView.showAlert()
            return }
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { user, error in
           
            guard error == nil && user != nil else {
                self.alertView.setText(StringConstants.wrongSignUpCredentials.rawValue)
                self.alertView.showAlert()
                return
            }
            self.performSegueTo(route: Route.segueToPersonalityTest)
        }
    }
    
    func loginTapped() {
        
        guard let emailText = emailTextfieldView.textField.text as String?, let passwordText = passwordTextfieldView.textField.text as String?, NetworkUtility.shared.isConnectedToInternet() else {
                self.alertView.setText(StringConstants.noConnectionToInternet.rawValue)
                self.alertView.showAlert()
            return }
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { [weak self] user, error in

            guard error == nil else {
                self?.alertView.setText( StringConstants.wrongLoginCredentials.rawValue)
                self?.alertView.showAlert()
                return
            }
            self?.performSegueTo(route: Route.segueToPersonalityTest)
        }
    }
    
    func forgotPasswordTapped() {
        guard let emailText = emailTextfieldView.textField.text as String?, NetworkUtility.shared.isConnectedToInternet() else {
                self.alertView.setText(StringConstants.noConnectionToInternet.rawValue)
                self.alertView.showAlert()
            return }
        Auth.auth().sendPasswordReset(withEmail: emailText, completion: { error in
            
            guard error == nil else {
                self.alertView.setText(StringConstants.wrongEmailAddress.rawValue)
                self.alertView.showAlert()
                return
            }
        })
    }
    
    func logOutTapped() {
       guard NetworkUtility.shared.isConnectedToInternet() else {
            self.alertView.setText(StringConstants.noConnectionToInternet.rawValue)
            self.alertView.showAlert()
            return }
        do {
            try Auth.auth().signOut()
            updateUI(isLoggedIn: false)
        } catch let error {
            print("error : \(error.localizedDescription)")
        }
    }
}

extension LoginViewController: AuthUIDelegate {
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {

        performSegueTo(route: Route.segueToPersonalityTest)
    }
}
