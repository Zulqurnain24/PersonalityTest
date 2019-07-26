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
    
    let questionAnswerTable = Bundle.main.loadNibNamed(Nibs.tableView.rawValue, owner: self, options: nil)?.last as! TableView
    let submitAnswersButton = Bundle.main.loadNibNamed(Nibs.buttonView.rawValue, owner: self, options: nil)?.last as! ButtonView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        hideKeyboardWhenTappedAround() 
    }
    

    func setupViews() {
        self.view.accessibilityIdentifier = AccessibilityIdentifier.quizViewController.rawValue
       
    }

}
