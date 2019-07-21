//
//  LoadingAnimationView.swift
//  PersonalityTest
//
//  Created by Mohammad Zulqarnain on 21/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class LoadingAnimationView: UIImageView {

    var duration = NumericConstants.splashAnimationTime.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        populateImagesInArray()
    }
    
    func populateImagesInArray() {
        let imgListArray :NSMutableArray = []
        for countValue in 1...6
        {
            
            guard let strImageName = "hearts_\(countValue).png" as String?,  let image  = UIImage(named: strImageName) else { return }
            
            imgListArray.add(image)
        }
        
        self.animationImages = imgListArray as? [UIImage];
        self.animationDuration = duration
    }
    
    func initiateAnimation( _ completionHandler: (() -> Void)? = nil) {
        self.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
            self.stopAnimating()
            guard completionHandler != nil else { return }
            completionHandler!()
        })
    }
    
}
