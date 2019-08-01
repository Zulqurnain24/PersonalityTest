//
//  PersonalityTest_AnswerTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_AnswerTest: XCTestCase {

    var sut: Answer!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = Answer(questionNumber: 1, answerText: "Yes")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let answer = Answer(questionNumber: 1, answerText: "Yes")
        XCTAssertEqual(sut, answer)
        XCTAssertEqual(sut.getAnswerText(), "Yes")
        XCTAssertEqual(sut.getDictionary(), ["answer": "Yes",
                                             "conditional answer": ""])
        XCTAssertEqual(sut.getQuestionNumber(), 1)
        
        sut.setConditionalAnswer(value: "Very Important")
        XCTAssertEqual(sut.getConditionalAnswer(), "Very Important")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
