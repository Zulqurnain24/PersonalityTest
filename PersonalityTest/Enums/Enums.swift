//
//  Enums.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//Segue Enum
enum Route: String {
    typealias RawValue = String
    
    case segueToLoginFlow = "segueToLoginFlow"
    case segueToPersonalityTest = "segueToPersonalityTestFlow"
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    
    case isValid = "Valid"
    case notValid = "Not Valid"
    case wrongSignUpCredentials = "You have entered the wrong signup credentials. Please provide the email address that does not already exist and a password must contain at least eight characters, at least one number and both lower and uppercase letters and special characters"
    case wrongLoginCredentials = "You have provide wrong login credentials"
    case wrongEmailAddress = "You have entered a wrong email"
    case emailPlaceHolder = "Enter Email"
    case passwordPlaceHolder = "Enter Password"
    case forgetPasswordButtonTitle = "Forgot Password?"
    case logOutButtonTitle = "Logout"
    case loginButtonTitle = "Login"
    case signupButtonTitle = "Signup"
    case personalityQuizButtonView = "Personality Quiz"
    case popoverContentViewControllerTitle = "Optional Question"
    case submitButtonTitle = "Submit"
    case personalityQuizViewControllerTitle = "-Personality Quiz-"
    case storyboardName = "Main"
    case noConnectionToInternet = "There is no Connection to internet. Please restore connection to continue"
}

//NumericConstants Enum
enum NumericConstants: Double {
    typealias RawValue = Double
    
    case splashAnimationTime = 3.0
    case questionCellDefaultHeight = 316
}

//ValidityType Enum
enum ValidityType: Int {
    case email
    case password
}

//Regex Enum
enum Regex: String {
    typealias RawValue = String
    
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
}

//Nibs Enum
enum Nibs: String {
    typealias RawValue = String
    
    case textfieldView = "TextfieldView"
    case buttonView = "ButtonView"
    case alertView = "AlertView"
    case loadingAnimationView = "LoadingAnimationView"
    case tableView = "TableView"
    case questionAnswerTableViewCell = "QuestionAnswerTableViewCell"
    case conditionalQuestionView = "ConditionalQuestionView"
    case choiceTableViewCell = "ChoiceTableViewCell"
    case customLabelView = "CustomLabelView"
}

//AccessibilityIdentifier Enum
enum AccessibilityIdentifier: String {
    typealias RawValue = String
    
    case alertView = "AlertView"
    case loadingAnimationView = "LoadingAnimationView"
    case buttonView = "ButtonView"
    case splashViewController = "SplashViewController"
    case loginViewController = "LoginViewController"
    case quizViewController = "QuizViewController"
    case personalityQuizViewController = "PersonalityQuizViewController"
    case emailTextfieldView = "EmailTextfieldView"
    case passwordTextfieldView = "PasswordTextfieldView"
    case loginButtonView = "LoginButtonView"
    case signupButtonView = "SignupButtonView"
    case logOutButtonView = "LogOutButtonView"
    case forgotPasswordButtonView = "ForgotPasswordButtonView"
    case signOutButtonView = "SignOutButtonView"
    case personalityQuizButtonView = "PersonalityQuizButtonView"
    case submitButtonView = "SubmitButtonView"
    case conditionalQuestionView = "ConditionalQuestionView"
    case questionAnswerTableViewCell = "QuestionAnswerTableViewCell"
    case popoverContentViewController = "PopoverContentViewController"
    case choiceTableViewCell = "ChoiceTableViewCell"
    
}

//QuestionCategory Enum
enum QuestionCategory: String, Codable {
    typealias RawValue = String
    
    case hard_fact = "hard_fact"
    case lifestyle = "lifestyle"
    case introversion = "introversion"
    case passion = "passion"
}
