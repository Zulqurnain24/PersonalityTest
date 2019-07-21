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
    case segueToForgetPasswordFlow = "segueToForgetPasswordFlow"
    case segueToRegisterationFlow = "segueToRegisterationFlow"
    case segueToRoutingFlow = "segueToRoutingFlow"
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    
    case isValid = "Valid"
    case notValid = "Not Valid"
}

//NumericConstants Enum
enum NumericConstants: Double {
    typealias RawValue = Double
    
    case splashAnimationTime = 3.0
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

