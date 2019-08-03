//
//  PersonalityTest_AppdelegateTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 04/08/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import PersonalityTest

class PersonalityTest_AppdelegateTest: XCTestCase {
    var sut: AppDelegate!
    
    override func setUp() {
        super.setUp()
        sut = AppDelegate()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       XCTAssertNotNil(sut)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
