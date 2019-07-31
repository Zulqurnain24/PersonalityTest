//
//  ViewController.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 18/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {

    @IBOutlet weak var customLabelViewHolder: UIView!
    @IBOutlet weak var splashAnimationViewHolder: UIView!
    let splashAnimationView = Bundle.main.loadNibNamed(Nibs.loadingAnimationView.rawValue, owner: self, options: nil)?.last as! LoadingAnimationView
    
        let customLabelView = Bundle.main.loadNibNamed(Nibs.customLabelView.rawValue, owner: self, options: nil)?.last as! CustomLabelView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        playAnimation()
    }

    func performSegueTo(route: Route) {
        performSegue(withIdentifier: route.rawValue, sender: nil)
    }

    func setupView() {
        self.view.accessibilityIdentifier = AccessibilityIdentifier.splashViewController.rawValue
        guard self.splashAnimationViewHolder != nil else { return }
        splashAnimationViewHolder.addSubview(splashAnimationView)
        customLabelViewHolder.addSubview(customLabelView)
       
    }
    
    func playAnimation() {
        splashAnimationView.initiateAnimation({
            self.performSegueTo(route: Route.segueToLoginFlow)
        })
    }
}

