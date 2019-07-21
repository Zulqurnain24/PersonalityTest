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

    @IBOutlet weak var splashAnimationViewHolder: UIView!
    let splashAnimationView = Bundle.main.loadNibNamed("LoadingAnimationView", owner: self, options: nil)?.last as! LoadingAnimationView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        playAnimation()
    }

    func performSegueTo(route: Route) {
        performSegue(withIdentifier: route.rawValue, sender: nil)
    }

    func setupView() {
        self.view.accessibilityIdentifier = "SplashViewController"
        guard self.splashAnimationViewHolder != nil else { return }
        splashAnimationViewHolder.addSubview(splashAnimationView)
       
    }
    
    func playAnimation() {
        splashAnimationView.initiateAnimation({
            self.performSegueTo(route: Route.segueToLoginFlow)
        })
    }
}

