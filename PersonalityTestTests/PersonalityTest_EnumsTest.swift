//
//  PersonalityTest_EnumsTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_EnumsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testExample() {

        //Route Enum
        XCTAssertEqual(Route.segueToLoginFlow.rawValue, "segueToLoginFlow")
        XCTAssertEqual(Route.segueToPersonalityTest.rawValue, "segueToPersonalityTestFlow")
        
        //StringConstants Enum
        XCTAssertEqual(StringConstants.isValid.rawValue, "Valid")
        XCTAssertEqual(StringConstants.notValid.rawValue, "Not Valid")
        
        //NumericConstants Enum
        XCTAssertEqual(NumericConstants.splashAnimationTime.rawValue, 3.0)

        //NumericConstants Enum
        XCTAssertEqual(ValidityType.email.rawValue,0)
        XCTAssertEqual(ValidityType.password.rawValue,1)
        
        //Regex Enum
        XCTAssertEqual(Regex.email.rawValue,"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        XCTAssertEqual(Regex.password.rawValue,"(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


}
