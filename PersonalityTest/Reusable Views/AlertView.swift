//
//  NetworkErrorAlertView.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    @IBOutlet weak var okButton: UIButton!
    var buttonCallback: (()->Void)?
    @IBOutlet weak var text: UILabel!
    let windows = UIApplication.shared.windows
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setText(_ value: String) {
        text.text = value
    }
    
    //for displaying alertview
    func showAlert() {
        self.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width/8, y: UIScreen.main.bounds.size.height/8), size: CGSize(width: 0.8 * UIScreen.main.bounds.size.width, height:  0.5 * UIScreen.main.bounds.size.height))
        let lastWindow = windows.last
        lastWindow?.addSubview(self)
    }
    
    @IBAction func okTapped(_ sender: Any) {
        self.removeFromSuperview()
        guard let callback  = buttonCallback as (()->Void)? else { return }
        callback()
    }
    
}
