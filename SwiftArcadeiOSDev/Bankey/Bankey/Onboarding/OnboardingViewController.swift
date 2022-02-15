//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Marcos Avila Rodriguez on 15/02/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackview = UIStackView()
    let imageView = UIImageView()
    
    let label = UILabel()
    
    let heroImageName, titleText: String
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been initialized")
    }
}

extension OnboardingViewController {
    
    func style() {
        
        view.backgroundColor = .systemBackground
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
    
//  Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: heroImageName)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.text = titleText
        
        
        
        
    }
    
    func layout() {
        stackview.addArrangedSubview(imageView)
        stackview.addArrangedSubview(label)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1)
        ])
    }
}
