//
//  PersonalityTest_ConditionalQuestionViewTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_ConditionalQuestionViewTest: XCTestCase {

    var sut: ConditionalQuestionView!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = ConditionalQuestionView(frame: CGRect(x: 0, y: 44, width: 414, height: 818))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.awakeFromNib()
        sut.configure(questionNumber: 2, questionString: "How important is the age of your partner to you?", range: NSRange(18...20), withAccessibilityIdentifier: AccessibilityIdentifier.conditionalQuestionView.rawValue)
        sut.setRangeArray()
        sut.setupViews()
        XCTAssertEqual(sut.rangeArray, [18, 19, 20, 21])
        XCTAssertEqual(sut.accessibilityIdentifier, AccessibilityIdentifier.conditionalQuestionView.rawValue)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
