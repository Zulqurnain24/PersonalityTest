//
//  PersonalityTest_DataManagerTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 31/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
import Firebase
import CodableFirebase
@testable import PersonalityTest

class PersonalityTest_DataManagerTest: XCTestCase {
    var sut: PersonalityQuizDataManager!
    var questionList: QuestionList!
    override func setUp() {
        super.setUp()
        sut = PersonalityQuizDataManager()
        
    }
    
    override func tearDown() {
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
        populateArrayFromJSONFile(completionHandler: { questions in
            sut.initFBQuestionsDatasource { dataSnapshot in
                self.questionList = QuestionList(questions: [])
                let _ = dataSnapshot.children.compactMap ({ child in
                    guard let value = (child as! DataSnapshot).value else { return }
                    do {
                        let question = try FirebaseDecoder().decode(Question.self, from: value)
                        self.questionList.questions.append(question)
                    } catch let error {
                        print("PersonalityQuizDataManager parse error : " + error.localizedDescription)
                    }
                })
                
                XCTAssertEqual(self.questionList.questions, questions)
            }
        })

        sut.addAnswer(questionNumber: 0, conditionalAnswer: "")

        XCTAssertEqual(sut.answers.first?.getConditionalAnswer(), nil)
        
        sut.addAnswer(questionNumber: 0, option: "male")
        
        XCTAssertEqual(sut.answers.first?.getAnswerText(), "male")
        
        XCTAssertNotNil(sut.quizQuestionsRef)
        
        XCTAssertNotNil(sut.usersRef)
        
        sut.uploadAnswers()
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
