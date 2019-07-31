//
//  PersonalityTest_QuestionListTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_QuestionListTest: XCTestCase {
    
    var sut: QuestionList!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = QuestionList(questions: [Question(question: "What is your gender?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "single_choice_conditional", options: [ "not important", "important", "very important" ], condition: Condition(predicate: Predicate(exactEquals: ["${selection}","very important"]), if_positive: IfPositive(question: "What age should your potential partner be?", category: QuestionCategory.hard_fact, question_type: Type(type: "number_range", range: ["from": 18,
            "to": 140]))), selectedOption: 3))])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let questionList = QuestionList(questions: [Question(question: "What is your gender?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "single_choice_conditional", options: [ "not important", "important", "very important" ], condition: Condition(predicate: Predicate(exactEquals: ["${selection}","very important"]), if_positive: IfPositive(question: "What age should your potential partner be?", category: QuestionCategory.hard_fact, question_type: Type(type: "number_range", range: ["from": 18,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       "to": 140]))), selectedOption: 3))])
        XCTAssertTrue(questionList == sut)
        XCTAssertEqual(sut.questions.count, 1)
        XCTAssertEqual(sut.questions.first?.question, "What is your gender?")
        XCTAssertEqual(sut.questions.first!.question_type, QuestionType(type: "single_choice_conditional", options: [ "not important", "important", "very important" ], condition: Condition(predicate: Predicate(exactEquals: ["${selection}","very important"]), if_positive: IfPositive(question: "What age should your potential partner be?", category: QuestionCategory.hard_fact, question_type: Type(type: "number_range", range: ["from": 18, "to": 140]))), selectedOption: 3))
        XCTAssertEqual(sut.questions.first?.category, QuestionCategory.hard_fact)
        XCTAssertEqual(sut.questions.first?.category, QuestionCategory.hard_fact)
        XCTAssertEqual(sut.questions.first?.category, QuestionCategory.hard_fact)
        XCTAssertEqual(sut.questions.first?.category, QuestionCategory.hard_fact)
        XCTAssertEqual(sut.questions.first?.category, QuestionCategory.hard_fact)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
