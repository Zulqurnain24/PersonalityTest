//
//  PopoverContentViewController.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 28/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class PopoverContentViewController: UIViewController {
    
    @IBOutlet weak var conditionalQuestionViewHolder: UIView!
    
    let conditionalQuestionView = Bundle.main.loadNibNamed(Nibs.conditionalQuestionView.rawValue, owner: self, options: nil)?.last as! ConditionalQuestionView
    
    private var range: NSRange!
    
    private var questionString: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    func setupViews() {
        self.title = StringConstants.popoverContentViewControllerTitle.rawValue
        self.view.accessibilityIdentifier = AccessibilityIdentifier.popoverContentViewController.rawValue
        conditionalQuestionView.frame = conditionalQuestionViewHolder.frame
        conditionalQuestionViewHolder.addSubview(conditionalQuestionView)
    }
}
