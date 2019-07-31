//
//  PersonalityTest_QuestionAnswerTableViewCellTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 30/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_QuestionAnswerTableViewCellTest: XCTestCase {
    
    var sut: QuestionAnswerTableViewCell!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = QuestionAnswerTableViewCell()
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
        sut.configure(withAccessibilityIdentifier: AccessibilityIdentifier.questionAnswerTableViewCell.rawValue)
        sut.populate(questionNumber: 0, question: Question(question: "What is your gender?", category: QuestionCategory(rawValue: QuestionCategory.hard_fact.rawValue)!, question_type: QuestionType(type: "hard_fact", options: ["male", "female", "other"], condition: Condition.init(predicate: Predicate(exactEquals: ["${selection}", "very important"]), if_positive: IfPositive(question: "What is your gender", category: QuestionCategory.hard_fact, question_type: Type(type: "Very Important", range: ["age":31]))), selectedOption: 0)))
        sut.refreshOptions()
        sut.updateQuestionAnswerTableViewCell(answer: Answer(questionNumber: 0, answerText: "very important"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
