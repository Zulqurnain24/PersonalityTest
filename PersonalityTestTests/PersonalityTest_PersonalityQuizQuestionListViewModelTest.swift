//
//  PersonalityTest_PersonalityQuizQuestionListViewModelTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_PersonalityQuizQuestionListViewModelTest: XCTestCase {

    var sut: PersonalityQuizQuestionListViewModel!
    var personalityQuizDataManager: PersonalityQuizDataManager!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = PersonalityQuizQuestionListViewModel(questionList: QuestionList(questions: [Question(question: "How important is the age of your partner to you?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "number_range", options: ["not important","important","very important"], condition: Condition(predicate: Predicate(exactEquals: ["${selection}","very important"]), if_positive: IfPositive(question: "What age should your potential partner be?", category: QuestionCategory.hard_fact, question_type: Type(type: "number_range", range: ["from":18, "to":140]))), selectedOption: 3))]))
        personalityQuizDataManager = PersonalityQuizDataManager()
        personalityQuizDataManager.initFBQuestionsDatasource { dataSnapShot in
            self.sut = PersonalityQuizQuestionListViewModel(dataSnapshot: dataSnapShot)
          
        }
      
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func populateArrayFromJSONFile(completionHandler: ([Question]) -> Void) {
        //load from json
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "questions", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let questions = try? decoder.decode([Question].self, from: data) else {
            return
        }
        completionHandler(questions)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
     
        self.populateArrayFromJSONFile(completionHandler: { questions in
            XCTAssertEqual(questions, self.sut.getQuestions())
        })
        
        self.sut.setSelectedOption(questionNumber: 0, value: 2)
        XCTAssertEqual(self.sut.getQuestions()[0].question_type.selectedOption, 2)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
