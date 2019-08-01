//
//  PersonalityTest_QuestionTypeTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_QuestionTypeTest: XCTestCase {

    var sut: QuestionType!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = QuestionType(type: "single_choice",
                           options: [
                            "not important",
                            "important",
                            "very important"
            ], condition: Condition(predicate: Predicate(exactEquals: [
                "${selection}",
                "very important"
                ]), if_positive: IfPositive(question: "What is your gender?", category: QuestionCategory.hard_fact, question_type: Type(type: "single_choice_conditional", range: ["from" : 18, "to" : 140]))), selectedOption: 0)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let questionType = QuestionType(type: "single_choice",
                           options: [
                            "not important",
                            "important",
                            "very important"
            ], condition: Condition(predicate: Predicate(exactEquals: [
                "${selection}",
                "very important"
                ]), if_positive: IfPositive(question: "What is your gender?", category: QuestionCategory.hard_fact, question_type: Type(type: "single_choice_conditional", range: ["from" : 18, "to" : 140]))), selectedOption: 0)
        XCTAssertTrue(sut == questionType)
        sut.setSelectedOption(value: 2)
        XCTAssertEqual(sut.selectedOption, 2)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
