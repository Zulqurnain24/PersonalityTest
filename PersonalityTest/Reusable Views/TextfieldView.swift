//
//  TextfieldView.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class TextfieldView: UIView {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var validityType: ValidityType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func configure(placeholder: String, withAccessibilityIdentifier: String, validityType: ValidityType) {
         textField.placeholder = placeholder
         self.validityType = validityType
         self.accessibilityIdentifier = withAccessibilityIdentifier
        guard self.validityType == ValidityType.password else {
            textField.isSecureTextEntry = false
            return
        }
        textField.isSecureTextEntry = true
    }
    
    func setupView() {
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
    }
    
    @objc func handleTextChange() {
        guard let text = textField.text, let validityType = self.validityType as ValidityType? else {return}
        guard !text.isEmpty else {
            errorMessageLabel.isHidden = true
            return }
            errorMessageLabel.isHidden = false
        if text.isValue(validityType) {
            errorMessageLabel.tintColor = UIColor.green
            errorMessageLabel.text = "Valid \(validityType)"
            errorMessageLabel.isHidden = true
        } else {
            errorMessageLabel.tintColor = UIColor.red
            errorMessageLabel.text = "Not Valid \(validityType)"
            errorMessageLabel.isHidden = false
        }
    }
}
