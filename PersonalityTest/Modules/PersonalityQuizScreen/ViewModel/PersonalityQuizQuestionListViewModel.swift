//
//  PersonalityQuizViewModel.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 28/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

struct PersonalityQuizQuestionListViewModel {
    var questionList: QuestionList!
}

extension PersonalityQuizQuestionListViewModel {
    init(dataSnapshot: DataSnapshot, _ completionHandler: (() -> Void)? = nil) {
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
    }
    
    func getQuestions() -> [Question] {
        guard let questionList = questionList else { return [] }
        return questionList.questions
    }
    
    mutating func setSelectedOption(questionNumber: Int, value: Int) {
        questionList
            .questions[questionNumber]
            .question_type
            .setSelectedOption(value: value)
    }
}
