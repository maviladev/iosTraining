//
//  ConstraintAnimationViewController.swift
//  AnimationDev
//
//  Created by David Kababyan on 17/11/2018.
//  Copyright © 2018 David Kababyan. All rights reserved.
//

import UIKit

class ConstraintAnimationViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var newsletterView: UIView!
    @IBOutlet weak var newsletterCenterX: NSLayoutConstraint!
    
    //MARK: Class Variables
    var newsletterInfoLabel = UILabel()
    

    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNewsletterLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Todo: Offscreen positioning
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Todo: Fire initial animations
    }
    
    // MARK: Actions
    
    // MARK: Animations

    
    //MARK: UISetup
    func setupNewsletterLabel() {
        newsletterInfoLabel.backgroundColor = .clear
        newsletterInfoLabel.text = "Help us make your animations much better by subscribing to our weekly newsletter! \n\n It's free and you can unsubscribe any time without hurting our feelings...much :)"
        newsletterInfoLabel.font = UIFont(name: "Bodoni 72 Oldstyle", size: 15)
        newsletterInfoLabel.textColor = .darkGray
        newsletterInfoLabel.textAlignment = .left
        newsletterInfoLabel.alpha = 1
        newsletterInfoLabel.backgroundColor = .black
        newsletterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        newsletterInfoLabel.numberOfLines = 0
    }
    

}
