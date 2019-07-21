//
//  PersonalityTest_LoginViewController.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_LoginViewController: XCTestCase {

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
        sut.setupViews()
        sut.performSegueTo(route: Route.segueToRegisterationFlow)
        sut.performSegueTo(route: Route.segueToForgetPasswordFlow)
        XCTAssertEqual(sut.view.accessibilityIdentifier , "LoginViewController")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
