//
//  Answer.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 28/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

struct Answer: Codable, Hashable {
    private var questionNumber: Int
    private var answerText: String
    private var conditionalAnswerText: String? = nil
    
    init(questionNumber: Int, answerText: String) {
       self.questionNumber = questionNumber
       self.answerText = answerText
    }
    
    public mutating func  setConditionalAnswer(value: String) {
      conditionalAnswerText = value
    }
    
    public func getConditionalAnswer() -> String {
        return conditionalAnswerText ?? ""
    }
    
    private var dictionary: [String: Any] {
        return ["answer": answerText,
                "conditional answer": conditionalAnswerText ?? ""]
    }
    
    func getAnswerText() -> String {
        return answerText
    }
    
    func getDictionary() -> NSDictionary {
        return dictionary as NSDictionary
    }
    
    func getQuestionNumber() -> Int {
        return questionNumber
    }
}

extension Answer: Equatable {
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.answerText == rhs.answerText
               && lhs.questionNumber == rhs.questionNumber
               && lhs.conditionalAnswerText == rhs.conditionalAnswerText
    }
}
