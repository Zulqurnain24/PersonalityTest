//
//  PersonalityTest_SplashViewController.swift
//  PersonalityTestTests
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import PersonalityTest

class PersonalityTest_SplashViewControllerTest: XCTestCase {
    var sut: SplashViewController!

    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: StringConstants.storyboardName.rawValue, bundle: nil)
            .instantiateInitialViewController() as? SplashViewController

    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testExample() {
        sut.viewDidLoad()
        sut.setupView()
        sut.playAnimation()
        sut.performSegueTo(route: Route.segueToLoginFlow)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

