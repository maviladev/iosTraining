//
//  SpringAnimationsViewController.swift
//  AnimationDev
//
//  Created by David Kababyan on 17/11/2018.
//  Copyright © 2018 David Kababyan. All rights reserved.
//

import UIKit

class SpringAnimationsViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginSegmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    @IBOutlet weak var textfieldContainerView: UIView!
    //MARK: Class vars
    let repeatPasswordTextField = UITextField()

    
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRepeatPasswordTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Todo: Animation setup
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Todo: Fire initial animations
    }

    
    
    //MARK: IBActions
    @IBAction func loginSegmentControllerValueChanged(_ sender: UISegmentedControl) {
        // Todo: Toggle UI layout

    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    // MARK: Animations & Transitions

    
    
    //MARK: Setup UI
    func createRepeatPasswordTextField() {
        
        repeatPasswordTextField.frame = CGRect(x: 0, y: (passwordTextField.frame.origin.y + passwordTextField.frame.size.height + 8), width: 225, height: 35)
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.backgroundColor = .white
        repeatPasswordTextField.layer.cornerRadius = 5.0
        repeatPasswordTextField.font = UIFont.systemFont(ofSize: 14)
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.contentVerticalAlignment = .center
    }


}
