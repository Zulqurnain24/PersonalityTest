//
//  QuestionList.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 28/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct QuestionList {

    var questions: [Question]

    init(questions: [Question]){
        self.questions = questions
    }

}

extension QuestionList: Equatable {
    static func == (lhs: QuestionList, rhs: QuestionList) -> Bool {
        return lhs.questions == rhs.questions
    }
}
