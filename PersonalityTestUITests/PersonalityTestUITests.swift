//
//  PersonalityTestUITests.swift
//  PersonalityTestUITests
//
//  Created by Mohammad Zulqarnain on 18/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class PersonalityTestUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
  
    }

    //Integration Tests
    
    func navigateToQuizFromLogoutScreen() {
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Personality Quiz"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"PersonalityQuizButtonView\"].buttons[\"Personality Quiz\"]",".buttons[\"Personality Quiz\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func login() {
        let app = XCUIApplication()
        let emailTextfieldView = app.textFields["EmailTextfieldView"]

        let passwordTextfieldView = app.textFields["PasswordTextfieldView"]
    
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: emailTextfieldView, handler: nil)
        emailTextfieldView.tap()
        emailTextfieldView.typeText("sheffield@yopmail.com")
        expectation(for: exists, evaluatedWith: passwordTextfieldView, handler: nil)
        passwordTextfieldView.tap()
        passwordTextfieldView.typeText("Sheffield123!")
        
        waitForExpectations(timeout: 5, handler: nil)
        
        app/*@START_MENU_TOKEN@*/.buttons["Login"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"LoginButtonView\"].buttons[\"Login\"]",".buttons[\"Login\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()

    }
    
    //on opening application where user is already logged in
    func signOut() {
        let app = XCUIApplication()
        app.otherElements["SplashViewController"].tap()
        app/*@START_MENU_TOKEN@*/.images["LoadingAnimationView"]/*[[".otherElements[\"SplashViewController\"].images[\"LoadingAnimationView\"]",".images[\"LoadingAnimationView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Logout"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"SignOutButtonView\"].buttons[\"Logout\"]",".buttons[\"Logout\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    //on opening application where user is already logged in
    func signOutOnNavigateBack() {
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Logout"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"SignOutButtonView\"].buttons[\"Logout\"]",".buttons[\"Logout\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func signUp() {
        //Add already registered email address
        let app = XCUIApplication()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertTrue( app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.exists, "Text field doesn't exist")
            app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.typeText("sheffield@yopmail.com")
            XCTAssertEqual( app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.value as! String, "sheffield@yopmail.com", "Text field value is not correct")
            
            app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            XCTAssertTrue( app/*@START_MENU_TOKEN@*/.secureTextFields["Enter Password"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"PasswordTextfieldView\"].secureTextFields[\"Enter Password\"]",".secureTextFields[\"Enter Password\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.exists, "Text field doesn't exist")
            app/*@START_MENU_TOKEN@*/.secureTextFields["Enter Password"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"PasswordTextfieldView\"].secureTextFields[\"Enter Password\"]",".secureTextFields[\"Enter Password\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.typeText("Sheffied123!")
            XCTAssertEqual( app/*@START_MENU_TOKEN@*/.secureTextFields["Enter Password"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"PasswordTextfieldView\"].secureTextFields[\"Enter Password\"]",".secureTextFields[\"Enter Password\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.value as! String, "Sheffied123!", "Text field value is not correct")
            
            app/*@START_MENU_TOKEN@*/.secureTextFields["Enter Password"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"PasswordTextfieldView\"].secureTextFields[\"Enter Password\"]",".secureTextFields[\"Enter Password\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            app/*@START_MENU_TOKEN@*/.buttons["Signup"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"SignupButtonView\"].buttons[\"Signup\"]",".buttons[\"Signup\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            let enterEmailTextField = app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
            enterEmailTextField.tap()
            
            let enterPasswordSecureTextField = app/*@START_MENU_TOKEN@*/.secureTextFields["Enter Password"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"PasswordTextfieldView\"].secureTextFields[\"Enter Password\"]",".secureTextFields[\"Enter Password\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
            enterPasswordSecureTextField.tap()
            
            app/*@START_MENU_TOKEN@*/.buttons["Signup"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"SignupButtonView\"].buttons[\"Signup\"]",".buttons[\"Signup\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        }
    }
    
    func forgetPassword() {
        let app = XCUIApplication()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertTrue( app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.exists, "Text field doesn't exist")
            app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.typeText("sheffield@yopmail.com")
            XCTAssertEqual( app/*@START_MENU_TOKEN@*/.textFields["Enter Email"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"EmailTextfieldView\"].textFields[\"Enter Email\"]",".textFields[\"Enter Email\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.value as! String, "sheffield@yopmail.com", "Text field value is not correct")
            
             XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Forgot Password?"]/*[[".otherElements[\"LoginViewController\"]",".otherElements[\"ForgotPasswordButtonView\"].buttons[\"Forgot Password?\"]",".buttons[\"Forgot Password?\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        }
    }
    
    func fewQuestionAnsweredTest() {
        let app = XCUIApplication()
        let tablesQuery = app/*@START_MENU_TOKEN@*/.tables/*[[".otherElements[\"QuizViewController\"].tables",".tables"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery.cells.matching(identifier: "QuestionAnswerTableViewCell").tables.cells.containing(.staticText, identifier:"male").buttons["Button"].tap()
        app/*@START_MENU_TOKEN@*/.tables.tables.staticTexts["female"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"female\"]",".staticTexts[\"female\"]",".tables"],[[[-1,4,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let button = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Q1").tables.cells.containing(.staticText, identifier:"0")/*[[".cells.containing(.staticText, identifier:\"How important is the gender of your partner?\").tables",".cells.containing(.staticText, identifier:\"not important\")",".cells.containing(.staticText, identifier:\"0\")",".cells.containing(.staticText, identifier:\"Q1\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.buttons["Button"]
        button.tap()
        button.tap()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["How important is the gender of your partner?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"How important is the gender of your partner?\"]",".staticTexts[\"How important is the gender of your partner?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q1").tables.staticTexts["important"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"How important is the gender of your partner?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"important\"]",".staticTexts[\"important\"]",".cells.containing(.staticText, identifier:\"Q1\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q3").tables.staticTexts["no"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"Do any children under the age of 18 live with you?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"no\"]",".staticTexts[\"no\"]",".cells.containing(.staticText, identifier:\"Q3\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q3").tables.staticTexts["sometimes"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"Do any children under the age of 18 live with you?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"sometimes\"]",".staticTexts[\"sometimes\"]",".cells.containing(.staticText, identifier:\"Q3\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q3").tables.staticTexts["yes"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"Do any children under the age of 18 live with you?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"yes\"]",".staticTexts[\"yes\"]",".cells.containing(.staticText, identifier:\"Q3\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeDown()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["How should your potential partner respond to this question?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"How should your potential partner respond to this question?\"]",".staticTexts[\"How should your potential partner respond to this question?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["Do any children under the age of 18 live with you?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"Do any children under the age of 18 live with you?\"]",".staticTexts[\"Do any children under the age of 18 live with you?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        
        let q4CellsQuery = tablesQuery.cells.containing(.staticText, identifier:"Q4")
        q4CellsQuery.tables.containing(.cell, identifier:"ChoiceTableViewCell").element.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q4").tables.staticTexts["sometimes"]/*[[".otherElements[\"QuizViewController\"].tables.cells.containing(.staticText, identifier:\"Q4\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"sometimes\"]",".staticTexts[\"sometimes\"]",".tables.cells.containing(.staticText, identifier:\"Q4\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeUp()
        q4CellsQuery.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"1")/*[[".cells.containing(.staticText, identifier:\"sometimes\")",".cells.containing(.staticText, identifier:\"1\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Button"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Q4").tables.cells.containing(.staticText, identifier:"0")/*[[".cells.containing(.staticText, identifier:\"How should your potential partner respond to this question?\").tables",".cells.containing(.staticText, identifier:\"yes\")",".cells.containing(.staticText, identifier:\"0\")",".cells.containing(.staticText, identifier:\"Q4\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.buttons["Button"].tap()
        app/*@START_MENU_TOKEN@*/.otherElements["SubmitButtonView"]/*[[".otherElements[\"QuizViewController\"].otherElements[\"SubmitButtonView\"]",".otherElements[\"SubmitButtonView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        q4CellsQuery.children(matching: .other).element(boundBy: 0).swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Q5").tables.cells.containing(.staticText, identifier:"0")/*[[".cells.containing(.staticText, identifier:\"Could you imagine having children with your potential partner?\").tables",".cells.containing(.staticText, identifier:\"yes\")",".cells.containing(.staticText, identifier:\"0\")",".cells.containing(.staticText, identifier:\"Q5\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.buttons["Button"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Q6").staticTexts["How should your potential partner respond to this question?"].swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q6").tables.staticTexts["yes"]/*[[".otherElements[\"QuizViewController\"].tables.cells.containing(.staticText, identifier:\"Q6\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"yes\"]",".staticTexts[\"yes\"]",".tables.cells.containing(.staticText, identifier:\"Q6\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeUp()
        
    }
    
    func allQuestionAnsweredTest() {
        
        let app = XCUIApplication()
        let tablesQuery2 = app/*@START_MENU_TOKEN@*/.tables/*[[".otherElements[\"QuizViewController\"].tables",".tables"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let tablesQuery = tablesQuery2.cells.matching(identifier: "QuestionAnswerTableViewCell").tables
        tablesQuery.cells.containing(.staticText, identifier:"male").buttons["Button"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"not important").buttons["Button"].tap()
        app/*@START_MENU_TOKEN@*/.tables.tables.staticTexts["not important"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"not important\"]",".staticTexts[\"not important\"]",".tables"],[[[-1,4,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["How important is the gender of your partner?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"How important is the gender of your partner?\"]",".staticTexts[\"How important is the gender of your partner?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q1").tables.staticTexts["not important"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"How important is the gender of your partner?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"not important\"]",".staticTexts[\"not important\"]",".cells.containing(.staticText, identifier:\"Q1\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let button = tablesQuery2/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Q2").tables.cells.containing(.staticText, identifier:"0")/*[[".cells.containing(.staticText, identifier:\"How important is the age of your partner to you?\").tables",".cells.containing(.staticText, identifier:\"not important\")",".cells.containing(.staticText, identifier:\"0\")",".cells.containing(.staticText, identifier:\"Q2\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.buttons["Button"]
        button.tap()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q2").tables.staticTexts["not important"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"How important is the age of your partner to you?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"not important\"]",".staticTexts[\"not important\"]",".cells.containing(.staticText, identifier:\"Q2\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q2").tables.staticTexts["important"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"How important is the age of your partner to you?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"important\"]",".staticTexts[\"important\"]",".cells.containing(.staticText, identifier:\"Q2\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["Do any children under the age of 18 live with you?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"Do any children under the age of 18 live with you?\"]",".staticTexts[\"Do any children under the age of 18 live with you?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeUp()
        button.tap()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q3").tables.staticTexts["sometimes"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"Do any children under the age of 18 live with you?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"sometimes\"]",".staticTexts[\"sometimes\"]",".cells.containing(.staticText, identifier:\"Q3\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["How should your potential partner respond to this question?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"How should your potential partner respond to this question?\"]",".staticTexts[\"How should your potential partner respond to this question?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery2.cells.containing(.staticText, identifier:"Q4").tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"0")/*[[".cells.containing(.staticText, identifier:\"yes\")",".cells.containing(.staticText, identifier:\"0\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Button"].tap()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q4").tables.staticTexts["yes"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"How should your potential partner respond to this question?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"yes\"]",".staticTexts[\"yes\"]",".cells.containing(.staticText, identifier:\"Q4\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        app.otherElements["QuizViewController"].tap()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q5").tables.staticTexts["yes"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"Could you imagine having children with your potential partner?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"yes\"]",".staticTexts[\"yes\"]",".cells.containing(.staticText, identifier:\"Q5\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let button2 = tablesQuery2/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Q5").tables.cells.containing(.staticText, identifier:"1")/*[[".cells.containing(.staticText, identifier:\"Could you imagine having children with your potential partner?\").tables",".cells.containing(.staticText, identifier:\"maybe\")",".cells.containing(.staticText, identifier:\"1\")",".cells.containing(.staticText, identifier:\"Q5\").tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.buttons["Button"]
        button2.tap()
        button2.tap()
        
        tablesQuery.cells.containing(.staticText, identifier:"I've been know to dabble").buttons["Button"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"I'm completely opposed").buttons["Button"].swipeUp()
        
        let quizviewcontrollerElement = app.otherElements["QuizViewController"]
        quizviewcontrollerElement.swipeUp()
        quizviewcontrollerElement.swipeUp()
        quizviewcontrollerElement.swipeUp()
        quizviewcontrollerElement.swipeUp()
        app/*@START_MENU_TOKEN@*/.tables/*[[".otherElements[\"QuizViewController\"].tables",".tables"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.matching(identifier: "QuestionAnswerTableViewCell").tables.cells.containing(.staticText, identifier:"an affair").buttons["Button"].tap()
        
        app.otherElements["QuizViewController"].swipeUp()
        app/*@START_MENU_TOKEN@*/.tables.cells.containing(.staticText, identifier:"Q15").tables.staticTexts["most of the time"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.containing(.staticText, identifier:\"When you're alone, do you get lonely quickly?\").tables",".cells.matching(identifier: \"ChoiceTableViewCell\").staticTexts[\"most of the time\"]",".staticTexts[\"most of the time\"]",".cells.containing(.staticText, identifier:\"Q15\").tables",".tables"],[[[-1,5,1],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0,0]]@END_MENU_TOKEN@*/.swipeDown()
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["When you're alone, do you get lonely quickly?"]/*[[".otherElements[\"QuizViewController\"].tables",".cells.matching(identifier: \"QuestionAnswerTableViewCell\").staticTexts[\"When you're alone, do you get lonely quickly?\"]",".staticTexts[\"When you're alone, do you get lonely quickly?\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.swipeDown()
        app/*@START_MENU_TOKEN@*/.tables/*[[".otherElements[\"QuizViewController\"].tables",".tables"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.matching(identifier: "QuestionAnswerTableViewCell").tables.cells.containing(.staticText, identifier:"separate flat / room in the same building").buttons["Button"].tap()
        
        
    }
    
    func noQuestionAnsweredTest() {
        
    }
}
