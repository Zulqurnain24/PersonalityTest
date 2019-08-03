//
//  PersonalityTest_TableViewCellsTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 04/08/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_TableViewCellsTest: XCTestCase {

    func testQuestionAnswerTableViewCell() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: StringConstants.storyboardName.rawValue, bundle: nil)
        let personalityQuizViewController = mainStoryboard.instantiateViewController(withIdentifier: "PersonalityQuizViewController") as? PersonalityQuizViewController
        personalityQuizViewController?.viewDidLoad()
        let questionAnswerTableViewCell = personalityQuizViewController?.tableView(personalityQuizViewController!.questionAnswerTableView, cellForRowAt: IndexPath(row: 0, section:0))
        XCTAssertNotNil(questionAnswerTableViewCell)
    }

    func testChoiceTableViewCell() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: StringConstants.storyboardName.rawValue, bundle: nil)
        let personalityQuizViewController = mainStoryboard.instantiateViewController(withIdentifier: "PersonalityQuizViewController") as? PersonalityQuizViewController
        personalityQuizViewController?.viewDidLoad()
        personalityQuizViewController?.personalityQuizQuestionListViewModel = PersonalityQuizQuestionListViewModel(questionList: QuestionList(questions: [
            Question(question: "How important is the gender of your partner?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "single_choice", options: [
                "not important",
                "important",
                "very important"
                ], condition: Condition(predicate: Predicate(exactEquals: [
                    "${selection}",
                    "very important"
                    ]), if_positive: IfPositive(question: "", category: QuestionCategory.hard_fact, question_type: Type(type: "", range: Dictionary<String, Int>()))), selectedOption: 0)),
            Question(question: "Do any children under the age of 18 live with you?", category: QuestionCategory.hard_fact, question_type: QuestionType(type: "single_choice", options: [
                "not important",
                "important",
                "very important"
                ], condition: Condition(predicate: Predicate(exactEquals: [
                    "",
                    ""
                    ]), if_positive: IfPositive(question: "", category: QuestionCategory.hard_fact, question_type: Type(type: "", range: Dictionary<String, Int>()))), selectedOption: 0)),
            Question(question: "How should your potential partner respond to this question?", category: QuestionCategory.lifestyle, question_type: QuestionType(type: "single_choice", options: [
                "yes",
                "sometimes",
                "no"
                ], condition: Condition(predicate: Predicate(exactEquals: [
                    "",
                    ""
                    ]), if_positive: IfPositive(question: "", category: QuestionCategory.hard_fact, question_type: Type(type: "", range: Dictionary<String, Int>()))), selectedOption: 0)),
            Question(question: "Could you imagine having children with your potential partner?", category: QuestionCategory.lifestyle, question_type: QuestionType(type: "single_choice", options: [
                "yes",
                "maybe",
                "no"
                ], condition: Condition(predicate: Predicate(exactEquals: [
                    "",
                    ""
                    ]), if_positive: IfPositive(question: "", category: QuestionCategory.hard_fact, question_type: Type(type: "", range: Dictionary<String, Int>()))), selectedOption: 0))
            ]))
        let questionAnswerTableViewCell = personalityQuizViewController?.tableView(personalityQuizViewController!.questionAnswerTableView, cellForRowAt: IndexPath(row: 0, section:0)) as! QuestionAnswerTableViewCell
        let choiceTableViewCell = questionAnswerTableViewCell.tableView(questionAnswerTableViewCell.choicesTableView, cellForRowAt: IndexPath(row: 0, section:0)) as! ChoiceTableViewCell
        awakeFromNib()

        choiceTableViewCell.update()

        choiceTableViewCell.populatepopulate(questionNumber: 0, questionString: "How important is the gender of your partner?", optionNumber: 0, optionName: "very important", isSelected: false)
        choiceTableViewCell.choiceButtonAction(choiceTableViewCell.choiceButton!)
        XCTAssertEqual(choiceTableViewCell.getTicked(), true)
        XCTAssertNotNil(choiceTableViewCell)
    }
}
