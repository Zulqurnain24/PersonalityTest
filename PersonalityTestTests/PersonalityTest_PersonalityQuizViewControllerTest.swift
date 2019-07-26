//
//  PersonalityTest_PersonalityQuizViewControllerTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 25/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_PersonalityQuizViewControllerTest: XCTestCase {
    var sut: PersonalityQuizViewController!

    override func setUp() {
        super.setUp()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStoryboard.instantiateViewController(withIdentifier: "PersonalityQuizViewController") as? PersonalityQuizViewController
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExample() {
        
        sut.viewDidLoad()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
