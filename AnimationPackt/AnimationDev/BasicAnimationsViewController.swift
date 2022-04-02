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
    }
    
//    MARK: - Animations
    func animaterTitle() {
        UIView.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y -= 50
        }
        
    }



}
