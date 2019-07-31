//
//  ChoiceTableViewCell.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 26/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol ChoiceTableViewCellDelegate: class {
    func updateQuestionAnswerTableViewCell(answer: Answer)
}

class ChoiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var choiceNumber: UILabel!
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var choiceButton: UIButton!
    weak var delegate: ChoiceTableViewCellDelegate?
    private var ticked = false
    var questionNumber: Int!
    var questionString: String!
    var callBack: (() -> Void)? = nil
    static let reuseIdentifier = "ChoiceTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessibilityIdentifier = AccessibilityIdentifier.choiceTableViewCell.rawValue
    }
    
    func update() {
        guard let imageName = ticked ? "tick" : "cross", choiceButton != nil else { return }
        choiceButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func populatepopulate(questionNumber: Int, questionString: String, optionNumber: Int, optionName: String, isSelected: Bool) {
        self.questionNumber = questionNumber
        self.questionString = questionString
        ticked = isSelected
        update()
        guard choiceNumber != nil, choiceLabel != nil else { return }
        choiceNumber.text = "\(optionNumber)"
        choiceLabel.text = optionName
    }

    @IBAction func choiceButtonAction(_ sender: Any) {
        ticked = !ticked
        guard choiceLabel != nil, let choiceString = choiceLabel.text as String?, let questionNumber = self.questionNumber as Int? else { return }
        delegate?.updateQuestionAnswerTableViewCell(answer: Answer(questionNumber: questionNumber, answerText: choiceString))
        update()
        guard callBack != nil else { return }
        callBack!()
    }
    
    func getTicked() -> Bool {
        return ticked
    }
}
