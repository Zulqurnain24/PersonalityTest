//
//  PersonalityTest_PopoverContentViewControllerTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 30/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_PopoverContentViewControllerTest: XCTestCase {
    var sut: PopoverContentViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: StringConstants.storyboardName.rawValue, bundle: nil)
        sut = mainStoryboard.instantiateViewController(withIdentifier: AccessibilityIdentifier.popoverContentViewController.rawValue) as? PopoverContentViewController
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.viewDidLoad()
        sut.setupViews()
        XCTAssertEqual(sut.title, StringConstants.popoverContentViewControllerTitle.rawValue)
        XCTAssertEqual(sut.view.accessibilityIdentifier, AccessibilityIdentifier.popoverContentViewController.rawValue)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
