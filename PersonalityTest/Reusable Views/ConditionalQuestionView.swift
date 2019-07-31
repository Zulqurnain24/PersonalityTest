//
//  ConditionalQuestionView.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 26/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol ConditionalQuestionViewDelegate: class {
    func conditionalAnswer(questionNumber: Int, optionalAnswerString: String)
}

class ConditionalQuestionView: UIView {
    @IBOutlet weak var conditionalQuestionLabel: UILabel!
    @IBOutlet weak var inBetweenTextLabel: UILabel!
    @IBOutlet weak var minRangePicker: UIPickerView!
    @IBOutlet weak var maxRangePicker: UIPickerView!
    @IBOutlet weak var submitButtonViewHolder: UIView!
    weak var delegate: ConditionalQuestionViewDelegate?
    let submitAnswersButton = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    var range: NSRange!
    var answer: String!
    var minRange: Int!
    var maxRange: Int!
    var questionNumber: Int!
    var rangeArray: [Int] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.range = NSRange(location: 0, length: 0)
        self.rangeArray = []
        setupViews()
    }
    
    func setRangeArray() {
        for i in range.lowerBound...range.upperBound {
            rangeArray.append(i)
        }
    }
    
    func setupViews() {
        guard minRangePicker != nil else { return }
        minRangePicker.tag = 0
        minRangePicker.delegate = self
        minRangePicker.dataSource = self
        
        maxRangePicker.tag = 1
        maxRangePicker.delegate = self
        maxRangePicker.dataSource = self
        submitAnswersButton.configure(title: StringConstants.submitButtonTitle.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.submitButtonView.rawValue)
        submitButtonViewHolder.addSubview(submitAnswersButton)
        submitAnswersButton.buttonCallback = {
            guard let minRange = "\(self.minRange ?? 0)" as String?, let maxRange = "\(self.maxRange ?? 0)" as String?,
                let questionNumber = self.questionNumber as Int?,
                let inBetweenTextLabelText = self.inBetweenTextLabel.text as String? else { return }
            self.answer = "\(minRange) \(inBetweenTextLabelText) \(maxRange)"
            self.delegate?.conditionalAnswer(questionNumber: questionNumber, optionalAnswerString: self.answer)
        }
    }

    func configure(questionNumber: Int, questionString: String, range: NSRange, withAccessibilityIdentifier: String) {
        
        self.accessibilityIdentifier = withAccessibilityIdentifier
        self.questionNumber = questionNumber
        self.range = range
        
        guard conditionalQuestionLabel != nil, minRangePicker != nil else { return }
    
        conditionalQuestionLabel.text = questionString
        
        setRangeArray()
   
        minRangePicker.reloadAllComponents()
        maxRangePicker.reloadAllComponents()
    }

}

extension ConditionalQuestionView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rangeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(rangeArray[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag {
        case 0:
            minRange = rangeArray[row]
            maxRangePicker.selectRow(row, inComponent: 0, animated: true)
            maxRange = rangeArray[row]
        case 1:
            maxRange = rangeArray[row]
        default:
            break
        }
        
        guard let minRange = minRange, let maxRange = maxRange else { return }
        
        if minRange > maxRange {
            self.minRange = self.maxRange
        }
    }
    
}
