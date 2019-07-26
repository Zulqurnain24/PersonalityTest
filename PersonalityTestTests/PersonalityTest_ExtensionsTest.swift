//
//  PersonalityTest_ExtensionsTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 25/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_ExtensionsTest: XCTestCase {

    var sut1: String!
    var sut2: UIViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut1 = String("")
        sut2 = UIViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         sut1 = nil
         sut2 = nil
         super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        //Testing String extension
        sut1 = "mohammad.zulqurnain@gmail.com"
        XCTAssertEqual(sut1.isValue(ValidityType.email), true)
        
        sut1 = "THumblina09!"
        XCTAssertEqual(sut1.isValue(ValidityType.password), true)
        
        sut1 = "daffodil@gmail"
        XCTAssertEqual(sut1.isValue(ValidityType.email), false)
        
        sut1 = "12312ksklfjjsl1"
        XCTAssertEqual(sut1.isValue(ValidityType.password), false)
        
        //Testing ViewController extension
        sut2.hideKeyboardWhenTappedAround()
        sut2.dismissKeyboard()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
