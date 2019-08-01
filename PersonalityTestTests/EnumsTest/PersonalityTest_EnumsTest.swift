//
//  PersonalityTest_EnumsTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_EnumsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testExample() {

        //Segue Enum
        XCTAssertEqual(Route.segueToLoginFlow.rawValue, "segueToLoginFlow")
        XCTAssertEqual(Route.segueToPersonalityTest.rawValue, "segueToPersonalityTestFlow")
        
        //StringConstants Enum
        XCTAssertEqual(StringConstants.isValid.rawValue, "Valid")
        XCTAssertEqual(StringConstants.notValid.rawValue, "Not Valid")
        XCTAssertEqual(StringConstants.wrongSignUpCredentials.rawValue, "You have entered the wrong signup credentials. Please provide the email address that does not already exist and a password must contain at least eight characters, at least one number and both lower and uppercase letters and special characters")
        XCTAssertEqual(StringConstants.wrongLoginCredentials.rawValue, "You have provide wrong login credentials")
        XCTAssertEqual(StringConstants.wrongEmailAddress.rawValue, "You have entered a wrong email")
        XCTAssertEqual(StringConstants.emailPlaceHolder.rawValue, "Enter Email")
        XCTAssertEqual(StringConstants.passwordPlaceHolder.rawValue, "Enter Password")
        
        XCTAssertEqual(StringConstants.logOutButtonTitle.rawValue, "Logout")
        XCTAssertEqual(StringConstants.loginButtonTitle.rawValue, "Login")
        XCTAssertEqual(StringConstants.signupButtonTitle.rawValue, "Signup")
        XCTAssertEqual(StringConstants.personalityQuizButtonView.rawValue, "Personality Quiz")
        XCTAssertEqual(StringConstants.popoverContentViewControllerTitle.rawValue, "Optional Question")
        XCTAssertEqual(StringConstants.submitButtonTitle.rawValue, "Submit")
        XCTAssertEqual(StringConstants.personalityQuizViewControllerTitle.rawValue, "-Personality Quiz-")
         XCTAssertEqual(StringConstants.storyboardName.rawValue, "Main")
         XCTAssertEqual(StringConstants.noConnectionToInternet.rawValue, "There is no Connection to internet. Please restore connection to continue")
        
        //NumericConstants Enum
        XCTAssertEqual(NumericConstants.splashAnimationTime.rawValue, 3.0)
        XCTAssertEqual(NumericConstants.questionCellDefaultHeight.rawValue, 316)
        
        //ValidityType Enum
        XCTAssertEqual(ValidityType.email.rawValue, 0)
        XCTAssertEqual(ValidityType.password.rawValue, 1)
        
        //Route Enum
        XCTAssertEqual(Route.segueToLoginFlow.rawValue, "segueToLoginFlow")
        XCTAssertEqual(Route.segueToPersonalityTest.rawValue, "segueToPersonalityTestFlow")
        
        //StringConstants Enum
        XCTAssertEqual(StringConstants.isValid.rawValue, "Valid")
        XCTAssertEqual(StringConstants.notValid.rawValue, "Not Valid")
        
        //NumericConstants Enum
        XCTAssertEqual(NumericConstants.splashAnimationTime.rawValue, 3.0)

        //NumericConstants Enum
        XCTAssertEqual(ValidityType.email.rawValue,0)
        XCTAssertEqual(ValidityType.password.rawValue,1)
        
        //Regex Enum
        XCTAssertEqual(Regex.email.rawValue,"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        XCTAssertEqual(Regex.password.rawValue,"(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        
        
        //Nibs Enum
         XCTAssertEqual(Nibs.textfieldView.rawValue,"TextfieldView")
         XCTAssertEqual(Nibs.buttonView.rawValue,"ButtonView")
         XCTAssertEqual(Nibs.alertView.rawValue,"AlertView")
         XCTAssertEqual(Nibs.loadingAnimationView.rawValue,"LoadingAnimationView")
         XCTAssertEqual(Nibs.tableView.rawValue,"TableView")
         XCTAssertEqual(Nibs.questionAnswerTableViewCell.rawValue,"QuestionAnswerTableViewCell")
         XCTAssertEqual(Nibs.conditionalQuestionView.rawValue,"ConditionalQuestionView")
         XCTAssertEqual(Nibs.choiceTableViewCell.rawValue,"ChoiceTableViewCell")
         XCTAssertEqual(Nibs.customLabelView.rawValue,"CustomLabelView")
        
        //AccessibilityIdentifier Enum
        XCTAssertEqual(AccessibilityIdentifier.alertView.rawValue,"AlertView")
        XCTAssertEqual(AccessibilityIdentifier.loadingAnimationView.rawValue,"LoadingAnimationView")
        XCTAssertEqual(AccessibilityIdentifier.buttonView.rawValue,"ButtonView")
        XCTAssertEqual(AccessibilityIdentifier.splashViewController.rawValue,"SplashViewController")
        XCTAssertEqual(AccessibilityIdentifier.loginViewController.rawValue,"LoginViewController")
        XCTAssertEqual(AccessibilityIdentifier.quizViewController.rawValue,"QuizViewController")
        XCTAssertEqual(AccessibilityIdentifier.personalityQuizViewController.rawValue,"PersonalityQuizViewController")
        XCTAssertEqual(AccessibilityIdentifier.emailTextfieldView.rawValue,"EmailTextfieldView")
        XCTAssertEqual(AccessibilityIdentifier.passwordTextfieldView.rawValue,"PasswordTextfieldView")
        XCTAssertEqual(AccessibilityIdentifier.loginButtonView.rawValue,"LoginButtonView")
        XCTAssertEqual(AccessibilityIdentifier.signupButtonView.rawValue,"SignupButtonView")
        XCTAssertEqual(AccessibilityIdentifier.logOutButtonView.rawValue,"LogOutButtonView")
        XCTAssertEqual(AccessibilityIdentifier.forgotPasswordButtonView.rawValue,"ForgotPasswordButtonView")
        XCTAssertEqual(AccessibilityIdentifier.signOutButtonView.rawValue,"SignOutButtonView")
        XCTAssertEqual(AccessibilityIdentifier.personalityQuizButtonView.rawValue,"PersonalityQuizButtonView")
        XCTAssertEqual(AccessibilityIdentifier.submitButtonView.rawValue,"SubmitButtonView")
        XCTAssertEqual(AccessibilityIdentifier.conditionalQuestionView.rawValue,"ConditionalQuestionView")
        XCTAssertEqual(AccessibilityIdentifier.questionAnswerTableViewCell.rawValue,"QuestionAnswerTableViewCell")
        XCTAssertEqual(AccessibilityIdentifier.popoverContentViewController.rawValue,"PopoverContentViewController")
        XCTAssertEqual(AccessibilityIdentifier.choiceTableViewCell.rawValue,"ChoiceTableViewCell")
        
        //QuestionCategory Enum
        XCTAssertEqual(QuestionCategory.hard_fact.rawValue,"hard_fact")
        XCTAssertEqual(QuestionCategory.lifestyle.rawValue,"lifestyle")
        XCTAssertEqual(QuestionCategory.introversion.rawValue,"introversion")
        XCTAssertEqual(QuestionCategory.passion.rawValue,"passion")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


}
