//
//  PersonalityTest_PersonalityQuizViewControllerTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 25/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_PersonalityQuizViewControllerTest: XCTestCase {
    var sut: PersonalityQuizViewController!

    override func setUp() {
        super.setUp()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: StringConstants.storyboardName.rawValue, bundle: nil)
        sut = mainStoryboard.instantiateViewController(withIdentifier: "PersonalityQuizViewController") as? PersonalityQuizViewController
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExample() {
        
        sut.viewDidLoad()
        sut.setupViews()
        sut.viewWillAppear(true)
        let promise = expectation(description: "initialize PersonalityQuizQuestionListViewModel Object")

        sut.populateUIFromDB({
          promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        self.sut.conditionalAnswer(questionNumber: 2, optionalAnswerString: "very important")
        self.sut.selectOption(questionNumber: 2, optionNumber: 3, answerString: "very important")
        XCTAssertEqual(self.sut.personalityQuizQuestionListViewModel.questionList.questions[2].question_type.selectedOption, 3)
        sut.showPopover(questionNumber: 2, questionString: "Yes", range: NSRange(location: 20, length: 5))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
