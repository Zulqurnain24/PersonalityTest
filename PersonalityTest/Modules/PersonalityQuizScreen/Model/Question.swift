//
//  PersonalityQuizModel.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//Predicate Struct
struct Predicate: Codable {
    var exactEquals: [String]
}

//PositiveCondition Struct
struct IfPositive: Codable {
    var question: String
    var category: QuestionCategory
    var question_type: Type
}

//IfPositive Struct
extension IfPositive: Equatable {
    static func == (lhs: IfPositive, rhs: IfPositive) -> Bool {
        return lhs.category == rhs.category
                && lhs.question == rhs.question
                && lhs.question_type.type == rhs.question_type.type
    }
}

//Type Struct
struct Type: Codable {
    var type: String
    var range: Dictionary<String, Int>
}

//Option struct
struct Option: Codable {
    let name: String
    var isSelected: Bool
    mutating func setIsSelected(value: Bool) {
        isSelected = value
    }
}

//QuestionType Struct
struct QuestionType: Codable {
    var type: String
    var options: [String]?
    var condition: Condition?
    var selectedOption: Int?
    
    public mutating func setSelectedOption(value: Int) {
        selectedOption = value
    }
}

extension QuestionType: Equatable {
    static func == (lhs: QuestionType, rhs: QuestionType) -> Bool {
        return lhs.condition == rhs.condition
                && lhs.options == rhs.options
                && lhs.selectedOption == rhs.selectedOption
                && lhs.type == rhs.type
    }
}

//Condition Struct
struct Condition: Codable {
    var predicate: Predicate
    var if_positive: IfPositive
}

extension Condition: Equatable {
    static func == (lhs: Condition, rhs: Condition) -> Bool {
        return lhs.if_positive == rhs.if_positive
               && lhs.predicate.exactEquals == rhs.predicate.exactEquals
    }
}

//Question Struct
struct Question {
    var question: String
    var category: QuestionCategory
    var question_type: QuestionType
}

extension Question: Codable {

    enum CodingKeys: String, CodingKey {
        case question = "question"
        case category = "category"
        case question_type = "question_type"
        case condition = "condition"
        case predicate = "predicate"
        case exactEquals = "exactEquals"
        case if_positive = "if_positive"
        case range = "range"
        case from = "from"
        case to = "to"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        question = try values.decode(String.self, forKey: .question)
        category = try values.decode(QuestionCategory.self, forKey: .category)
        question_type = try values.decode(QuestionType.self, forKey: .question_type)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(question, forKey: .question)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encode(question_type, forKey: .question_type)
    }
}

extension Question: Equatable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.question == rhs.question && lhs.category == rhs.category
                && lhs.question_type.type == rhs.question_type.type
                && lhs.question_type.options == rhs.question_type.options
                && lhs.question_type.condition?.predicate.exactEquals.last == rhs.question_type.condition?.predicate.exactEquals.last
                && lhs.question_type.condition?.if_positive.question == rhs.question_type.condition?.if_positive.question
    }
}
