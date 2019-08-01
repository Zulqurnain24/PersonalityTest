//
//  PersonalityTest_ReusableViews.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_ReusableViewsTest: XCTestCase {

     var sut1 = Bundle.main.loadNibNamed(Nibs.textfieldView.rawValue, owner: self, options: nil)?.last as! TextfieldView?
     var sut2 = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView?
     var sut3 = Bundle.main.loadNibNamed(Nibs.loadingAnimationView.rawValue, owner: self, options: nil)?.last as! LoadingAnimationView?
     var sut4 = Bundle.main.loadNibNamed(Nibs.alertView.rawValue, owner: self, options: nil)?.last as! AlertView
    
    override func setUp() {
        super.setUp()
        sut1?.awakeFromNib()
        sut1?.handleTextChange()
        sut1?.configure(placeholder: "Enter Email", withAccessibilityIdentifier: AccessibilityIdentifier.emailTextfieldView.rawValue, validityType: ValidityType.email)
        
        sut2?.awakeFromNib()
        sut2?.configure(title: "Forgot Password?", withAccessibilityIdentifier: AccessibilityIdentifier.emailTextfieldView.rawValue)
        
        sut3?.awakeFromNib()
        sut3?.initiateAnimation()
        
        sut4.awakeFromNib()
        sut4.setText(StringConstants.wrongSignUpCredentials.rawValue)
        sut4.showAlert()
        sut4.okTapped(sut4.okButton!)
    }
    
    override func tearDown() {
        sut1 = nil
        
        sut2 = nil
        
        sut3 = nil
        
        super.tearDown()
    }
    
    func testExample() {
        sut1?.configure(placeholder: "Test Placeholder", withAccessibilityIdentifier: "TextfieldView", validityType: ValidityType.email)
        sut1?.configure(placeholder: "Test Placeholder", withAccessibilityIdentifier: "TextfieldView", validityType: ValidityType.password)
        sut1?.setupView()
        sut1?.handleTextChange()
        
        sut2?.buttonCallback = { print("test worked") }
        sut2?.configure(title: "Test title", withAccessibilityIdentifier: "ButtonView", completionHandler: nil)
        
        sut3?.initiateAnimation()
        sut3?.populateImagesInArray()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
