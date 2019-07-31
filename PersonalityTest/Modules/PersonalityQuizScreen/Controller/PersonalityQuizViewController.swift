//
//  PersonalityQuizViewController.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class PersonalityQuizViewController: UIViewController {


    @IBOutlet weak var questionAnswerTableViewHolder: UIView!
    @IBOutlet weak var submitAnswersButtonViewHolder: UIView!
    
    let questionAnswerTableView = Bundle.main.loadNibNamed(Nibs.tableView.rawValue, owner: self, options: nil)?.last as! TableView
    let submitAnswersButton = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
     let conditionalQuestionView = Bundle.main.loadNibNamed(Nibs.conditionalQuestionView.rawValue, owner: self, options: nil)?.last as! ConditionalQuestionView
    
    var personalityQuizDataManager: PersonalityQuizDataManager!
    var personalityQuizQuestionListViewModel: PersonalityQuizQuestionListViewModel!
   
    let alertView = Bundle.main.loadNibNamed(Nibs.alertView.rawValue, owner: self, options: nil)?.last as! AlertView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        hideKeyboardWhenTappedAround()
        populateUIFromDB()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
 
    func setupViews() {
        self.title = StringConstants.personalityQuizViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = AccessibilityIdentifier.quizViewController.rawValue
        conditionalQuestionView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: questionAnswerTableView.visibleSize.width, height: 400))
        questionAnswerTableView.delegate = self
        questionAnswerTableView.dataSource = self
        questionAnswerTableView.rowHeight = UITableView.automaticDimension
        questionAnswerTableView.estimatedRowHeight = CGFloat(NumericConstants.questionCellDefaultHeight.rawValue)
        questionAnswerTableView.register(UINib(nibName: Nibs.questionAnswerTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: QuestionAnswerTableViewCell.reuseIdentifier)
        questionAnswerTableViewHolder.addSubview(questionAnswerTableView)
        
        submitAnswersButton.configure(title: StringConstants.submitButtonTitle.rawValue, withAccessibilityIdentifier: AccessibilityIdentifier.submitButtonView.rawValue, color: UIColor.gray, completionHandler: {
            guard NetworkUtility.shared.isConnectedToInternet() else {
                self.alertView.setText(StringConstants.noConnectionToInternet.rawValue)
                self.alertView.showAlert()
                return
            }
            self.personalityQuizDataManager.uploadAnswers()
        })
        
        submitAnswersButtonViewHolder.addSubview(submitAnswersButton)
    }

    func populateUIFromDB(_ completionHandler: (() -> Void)? = nil) {
        personalityQuizDataManager = PersonalityQuizDataManager()
        
        personalityQuizDataManager.initFBQuestionsDatasource { dataSnapshot in
            self.personalityQuizQuestionListViewModel = PersonalityQuizQuestionListViewModel(dataSnapshot: dataSnapshot)
            self.questionAnswerTableView.reloadData()
            guard completionHandler != nil else { return }
            completionHandler!()
        }
    }
}

extension PersonalityQuizViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let personalityQuizViewModel = self.personalityQuizQuestionListViewModel as PersonalityQuizQuestionListViewModel?, let totalOptions = personalityQuizViewModel.getQuestions()[indexPath.row].question_type.options?.count as Int? else { return 0 }
        return CGFloat(117 + totalOptions * 44)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let personalityQuizViewModel = self.personalityQuizQuestionListViewModel as PersonalityQuizQuestionListViewModel? else { return 0 }
       
        return personalityQuizViewModel.getQuestions().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard personalityQuizQuestionListViewModel != nil else { return UITableViewCell() }
        
        let questionAnswerTableViewCell = tableView.dequeueReusableCell(withIdentifier: QuestionAnswerTableViewCell.reuseIdentifier, for: indexPath) as! QuestionAnswerTableViewCell
        questionAnswerTableViewCell.prepareForReuse()
        questionAnswerTableViewCell.delegate = self
        
        guard let questions =  personalityQuizQuestionListViewModel.getQuestions() as [Question]? else { return UITableViewCell()}

        questionAnswerTableViewCell.populate(questionNumber: indexPath.row, question: questions[indexPath.row])
        return questionAnswerTableViewCell
    }
}

extension PersonalityQuizViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .currentContext
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}

extension PersonalityQuizViewController: ConditionalQuestionViewDelegate {
    func conditionalAnswer(questionNumber: Int, optionalAnswerString: String) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            topController.dismiss(animated: true, completion: {
                self.personalityQuizDataManager
                    .addAnswer(questionNumber: questionNumber,
                                conditionalAnswer: optionalAnswerString)
            })
        }
    }

}

extension PersonalityQuizViewController: QuestionAnswerTableViewCellDelegate {

    func selectOption(questionNumber: Int, optionNumber: Int, answerString: String) {
        personalityQuizQuestionListViewModel.setSelectedOption(questionNumber: questionNumber, value: optionNumber)
        personalityQuizDataManager.addAnswer(questionNumber: questionNumber, option: answerString)
        questionAnswerTableView.reloadData()
        if let questionType = personalityQuizQuestionListViewModel.getQuestions()[questionNumber].question_type as QuestionType?,
            questionType.condition?.predicate.exactEquals.last == answerString,
            let from = questionType.condition?.if_positive.question_type.range["from"] as Int?,
            let to = questionType.condition?.if_positive.question_type.range["to"] as Int?,
            let range = NSRange(location: from, length: to - from) as NSRange?,
            let questionString = questionType.condition?.if_positive.question as String? {
            showPopover(questionNumber: questionNumber, questionString: questionString, range: range)
        }
    }
    
    func showPopover(questionNumber: Int, questionString: String, range: NSRange) {
        let popoverContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PopoverContentViewController") as? PopoverContentViewController
       popoverContentViewController?.modalPresentationStyle = .popover
       popoverContentViewController?.conditionalQuestionView.configure(questionNumber: questionNumber,
                                                                       questionString: questionString,
                                                                       range: range,
                                                                       withAccessibilityIdentifier: AccessibilityIdentifier.conditionalQuestionView.rawValue)
       popoverContentViewController?.conditionalQuestionView.delegate = self
        if let popoverPresentationController = popoverContentViewController?.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .any
            popoverPresentationController.sourceView = self.conditionalQuestionView
            popoverPresentationController.sourceRect = conditionalQuestionView.frame
            popoverPresentationController.sourceView?.frame = conditionalQuestionView.frame
            popoverPresentationController.delegate = self
            
            if let popoverController = popoverContentViewController {
                present(popoverController, animated: true, completion: nil)
            }
        }
    }
   
}
