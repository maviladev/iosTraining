//
//  LoginView.swift
//  Bankey
//
//  Created by Marcos Avila Rodriguez on 10/02/22.
//

import Foundation
import UIKit

class LoginView: UIView, UITextFieldDelegate {
    
    let usernameTextField = UITextField()
    let userPassTextField = UITextField()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        userPassTextField.translatesAutoresizingMaskIntoConstraints = false
        userPassTextField.placeholder = "Password"
        userPassTextField.isSecureTextEntry = true
        userPassTextField.delegate = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(userPassTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
            
        ])
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        userPassTextField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

// MARK: - UITextFieldDelegate

