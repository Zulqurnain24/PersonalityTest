//
//  PersonalityTest_PopoverContentViewControllerTest.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 30/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_PopoverContentViewControllerTest: XCTestCase {
    var sut: PopoverContentViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: StringConstants.storyboardName.rawValue, bundle: nil)
        sut = mainStoryboard.instantiateViewController(withIdentifier: AccessibilityIdentifier.popoverContentViewController.rawValue) as? PopoverContentViewController
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.viewDidLoad()
        sut.setupViews()
        sut.conditionalQuestionView.awakeFromNib()
        sut.conditionalQuestionView.setRangeArray()
        sut.conditionalQuestionView.setupViews()
        sut.conditionalQuestionView.configure(questionNumber: 0, questionString: "How important is the age of your partner to you?", range: NSRange(location: 20, length: 4), withAccessibilityIdentifier: AccessibilityIdentifier.conditionalQuestionView.rawValue)
        let _ = sut.conditionalQuestionView.numberOfComponents(in: sut.conditionalQuestionView.minRangePicker)
        let _ = sut.conditionalQuestionView.numberOfComponents(in: sut.conditionalQuestionView.maxRangePicker)
        let _ = sut.conditionalQuestionView.pickerView(sut.conditionalQuestionView.minRangePicker, numberOfRowsInComponent: 0)
        let _ = sut.conditionalQuestionView.pickerView(sut.conditionalQuestionView.maxRangePicker, numberOfRowsInComponent: 0)
   sut.conditionalQuestionView.pickerView(sut.conditionalQuestionView.minRangePicker, didSelectRow: 0, inComponent: 0)
        sut.conditionalQuestionView.pickerView(sut.conditionalQuestionView.maxRangePicker, didSelectRow: 0, inComponent: 0)
        XCTAssertEqual(sut.title, StringConstants.popoverContentViewControllerTitle.rawValue)
        XCTAssertEqual(sut.view.accessibilityIdentifier, AccessibilityIdentifier.popoverContentViewController.rawValue)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
