//
//  QuestionAnswerTableViewCell.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 25/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol QuestionAnswerTableViewCellDelegate:class {
    func showPopover(questionNumber: Int, questionString: String, range: NSRange)
    func selectOption(questionNumber: Int, optionNumber: Int, answerString: String)
}

class QuestionAnswerTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choicesTableView: UITableView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    weak var delegate: QuestionAnswerTableViewCellDelegate?
    static let reuseIdentifier = "QuestionAnswerTableViewCell"
    private var options: [Option]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        options = []
        setupViews()
        configure(withAccessibilityIdentifier: AccessibilityIdentifier.questionAnswerTableViewCell.rawValue)
    }

    func refreshOptions() {
        for i in 0..<options.count {
            options[i].setIsSelected(value: false)
        }
    }
    
    func setupViews() {
        guard choicesTableView != nil else { return }
        choicesTableView.delegate = self
        choicesTableView.dataSource = self
        choicesTableView.register(UINib(nibName: Nibs.choiceTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: ChoiceTableViewCell.reuseIdentifier)
    }
    
    func configure(withAccessibilityIdentifier: String) {
       accessibilityIdentifier = withAccessibilityIdentifier
    }
    
    func populate(questionNumber: Int, question: Question) {
        guard questionNumberLabel != nil,
              questionLabel != nil,
              choicesTableView != nil else { return }
        self.questionNumberLabel.text = "Q\(questionNumber)"
        self.questionLabel.text = question.question
        self.options = question
                        .question_type
                        .options?.compactMap({ optionName in
            Option(name: optionName, isSelected: false)
        })
        if let selectedOption = question.question_type.selectedOption as Int?,
            selectedOption < self.options.count {
            self.options?[selectedOption].setIsSelected(value: true)
        }
        choicesTableView.reloadData()
    }

}

extension QuestionAnswerTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let options = self.options as [Option]?,
            indexPath.row < options.count,
            let questionString = questionLabel.text,
            let questionNumberString = questionNumberLabel.text,
            let questionNumber = Int(questionNumberString.replacingOccurrences(of: "Q", with: "")) as Int?,
            let row = indexPath.row as Int? else { return UITableViewCell() }
        let choiceTableViewCell = tableView.dequeueReusableCell(withIdentifier: ChoiceTableViewCell.reuseIdentifier, for: indexPath) as! ChoiceTableViewCell
        choiceTableViewCell.delegate = self

        choiceTableViewCell.populatepopulate(questionNumber: questionNumber,
                                             questionString: questionString,
                                             optionNumber: row,
                                             optionName: options[row].name,
                                             isSelected: options[row].isSelected)
        choiceTableViewCell.update()
        choiceTableViewCell.callBack = {
            self.refreshOptions()
            self.options[indexPath.row].setIsSelected(value: choiceTableViewCell.getTicked())
            choiceTableViewCell.update()
        }
        return choiceTableViewCell
    }

}

extension QuestionAnswerTableViewCell: ChoiceTableViewCellDelegate {
    func updateQuestionAnswerTableViewCell(answer: Answer) {
        for i in 0..<options.count where options[i].name == answer.getAnswerText() {
            self.delegate?.selectOption(questionNumber: answer.getQuestionNumber(),
                                optionNumber: i, answerString: answer.getAnswerText())
            choicesTableView.reloadData()
        }
        
    }
    
}
