//
//  PersonalityQuizDataManager.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 28/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Firebase

class PersonalityQuizDataManager {

    var user: User!

    var quizQuestionsRef: DatabaseReference!
    
    var usersRef: DatabaseReference!
    
    var answers: Set<Answer>!
    
    init() {
        quizQuestionsRef = Database.database().reference(withPath: "questions")
        usersRef = Database.database().reference(withPath: "users")
        answers = Set<Answer>()
        guard let user = Auth.auth().currentUser else { return }
        self.user = user
    }
    
    func initFBQuestionsDatasource(completionHandler: @escaping (DataSnapshot) -> Void) {
        quizQuestionsRef.observe(.value, with: { snapshot in
            completionHandler(snapshot)
        })
    }
    
    func addAnswer(questionNumber: Int, conditionalAnswer: String) {
        var answer = answers.filter({$0.getQuestionNumber() == questionNumber}).first as Answer?
        guard let requiredAnswer = answer as Answer? else { return }
        answers.remove(requiredAnswer)
        answer?.setConditionalAnswer(value: conditionalAnswer)
        answers.insert(answer!)
    }
    
    func addAnswer(questionNumber: Int, option: String) {
        answers.insert(Answer(questionNumber: questionNumber, answerText: option))
    }
    
    func uploadAnswers() {
        var dictionaryArray = [Dictionary<String, Any>]()
        guard let user = self.user as User?,
            let answers = self.answers as Set<Answer>?,
            let userEmail = user.email as String? else { return }
            answers.forEach({ answer in
                dictionaryArray.append(["Q\(answer.getQuestionNumber())" : answer.getDictionary() as NSDictionary])
            })

        guard let name = userEmail.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil) as String? else { return }
        self.usersRef.child(name).removeValue()
        guard let usersRef = self.usersRef.child(name) as DatabaseReference? else { return }
        usersRef.childByAutoId().updateChildValues(["userEmail" : userEmail, "personality_quiz_answers" : dictionaryArray])
    }
}
