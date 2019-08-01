//
//  PersonalityTest_ChoiceTableViewCellTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 30/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_ChoiceTableViewCellTest: XCTestCase {

    var sut: ChoiceTableViewCell!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = ChoiceTableViewCell()
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
        XCTAssertEqual(sut.accessibilityIdentifier, AccessibilityIdentifier.choiceTableViewCell.rawValue)
        sut.callBack = {
            print("Test")
        }
       
        XCTAssertEqual( sut.getTicked(), false)
        sut.populatepopulate(questionNumber: 0, questionString: "What should be the age of your partner?", optionNumber: 2, optionName: "31", isSelected: true)

         XCTAssertEqual(sut.questionString, "What should be the age of your partner?")
        sut.update()
        //sut.choiceButtonAction(self)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
