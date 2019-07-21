//
//  ButtonView.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    @IBOutlet weak var button: UIButton!
    
    var buttonCallback: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String, withAccessibilityIdentifier: String, completionHandler: (() -> Void)? = nil) {
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        accessibilityIdentifier = withAccessibilityIdentifier
        button.setTitle(title, for: .normal)
        guard buttonCallback != nil else { return }
        self.buttonCallback = completionHandler
    }

    @IBAction func buttonAction(_ sender: Any) {
        guard buttonCallback != nil else { return }
        buttonCallback!()
    }
 
}
