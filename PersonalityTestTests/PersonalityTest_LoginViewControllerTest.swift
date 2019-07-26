//
//  PersonalityTest_LoginViewController.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_LoginViewControllerTest: XCTestCase {

    var sut: LoginViewController!
    
    override func setUp() {
        super.setUp()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController

    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testExample() {
        
        sut.viewDidLoad()
        sut.viewWillAppear(true)
        sut.setupViews()
        XCTAssertEqual(sut.view.accessibilityIdentifier , AccessibilityIdentifier.loginViewController.rawValue)
        
        sut.forgotPasswordButtonView.buttonCallback = {
            self.sut.forgotPasswordTapped()
        }
        
      sut.forgotPasswordButtonView.buttonAction(sut.forgotPasswordButtonView.button!)
        
        sut.signupButtonView.buttonCallback = {
            self.sut.signUpTapped()
        }
        
        sut.signupButtonView.buttonAction(sut.signupButtonView.button!)
        
        sut.loginButtonView.buttonCallback = {
            self.sut.loginTapped()
        }

        sut.loginButtonView.buttonAction(sut.loginButtonView.button!)
        
        sut.signUpTapped()
        sut.loginTapped()
        sut.forgotPasswordTapped()
        sut.performSegueTo(route: Route.segueToPersonalityTest)
        sut.viewWillDisappear(true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
