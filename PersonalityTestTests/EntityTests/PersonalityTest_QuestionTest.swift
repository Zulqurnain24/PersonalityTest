//
//  PersonalityTest_QuestionTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_QuestionTest: XCTestCase {
    
    var sut: Question!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = Question(question: "How important is the age of your partner to you?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "number_range", options: ["not important","important","very important"], condition: Condition(predicate: Predicate(exactEquals: ["${selection}","very important"]), if_positive: IfPositive(question: "What age should your potential partner be?", category: QuestionCategory.hard_fact, question_type: Type(type: "number_range", range: ["from":18, "to":140]))), selectedOption: 3))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(sut.question, "How important is the age of your partner to you?")
        XCTAssertEqual(sut.category.rawValue, QuestionCategory.hard_fact.rawValue)
        XCTAssertEqual(sut.question_type.condition?.if_positive.category.rawValue, QuestionCategory.hard_fact.rawValue)
        XCTAssertEqual(sut.question_type.condition?.if_positive.question, "What age should your potential partner be?")
        XCTAssertEqual(sut.question_type.condition?.if_positive.question_type.range, ["from":18, "to":140])
        XCTAssertEqual(sut.question_type.condition?.if_positive.question_type.type, "number_range")
        
        let question = Question(question: "How important is the age of your partner to you?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "number_range", options: ["not important","important","very important"], condition: Condition(predicate: Predicate(exactEquals: ["${selection}","very important"]), if_positive: IfPositive(question: "What age should your potential partner be?", category: QuestionCategory.hard_fact, question_type: Type(type: "number_range", range: ["from":18, "to":140]))), selectedOption: 3))
        
        XCTAssertTrue(sut == question)
        let encoder = JSONEncoder()
        let questionData = try! encoder.encode(sut)
        let decoder = JSONDecoder()
        let questionDecoded = try! decoder.decode(Question.self, from: questionData)
        XCTAssertTrue(questionDecoded == sut)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
