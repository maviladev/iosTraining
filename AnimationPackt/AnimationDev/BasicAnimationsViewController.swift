//
//  BasicAnimationsViewController.swift
//  AnimationDev
//
//  Created by David Kababyan on 17/11/2018.
//  Copyright © 2018 David Kababyan. All rights reserved.
//

import UIKit

class BasicAnimationsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Animation setup
        titleLabel.alpha = 0
        logoImageView.alpha = 0
        loadingLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire initial animations
        animaterTitle()
        animateLogo()
    }
    
//    MARK: - Animations
    func animaterTitle() {
        UIView.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y -= 50
        }
        
    }

    func animateLogo() {
        UIView.animate(withDuration: 1.5, delay: 0.75, options:[.curveEaseInOut], animations: {
            
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { (completed) in
            self.animateLoading()
            self.segueToNextViewController(segueID: Segues.toSpringsVC, delay: 3.0)
        }
    }
    
    func animateLoading() {
        UIView.animate(withDuration: 1, delay: 0, options:[.repeat, .autoreverse, .curveEaseInOut ], animations: {
            
            self.loadingLabel.alpha = 1
            self.loadingLabel.frame.origin.y += 50
            self.loadingLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { (completed) in
            print("Loading animation complete")
        }
    }
}
