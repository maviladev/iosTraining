//
//  ViewController.swift
//  Onboarding Screens
//
//  Created by Marcos Avila Rodriguez on 25/02/22.
//

import UIKit

struct OnboardingItems {
    let title: String
    let detail: String
    let bgImage: UIImage?
}


class ViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!

//    Declare an empty array
//    private let items: [OnboardingItems] = []
    
    private let items: [OnboardingItems] = [
        .init(title: "Travel Your Way",
              detail: "Travel the world by air, rail or sea at the most competitive prices",
              bgImage: nil),
        .init(title: "Stay Your Way",
              detail: "With over millions of hotels worldwide, find the perfect accomodation in the most amazing places!",
              bgImage: nil),
        .init(title: "Discover Your Way With New Features",
              detail: "Explore exotic destinations with our new features that link you to like-minded travellers!",
              bgImage: nil),
        .init(title: "Feast Your Way",
              detail: "we recommend you local cuisines that are safe and highly recommended by the locals!",
              bgImage: nil)
    ]
    
    private var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageControl()
        setupScreen(index: currentPage)
        setupTapGesture()
        
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = items.count
        
    }

    private func setupScreen(index: Int) {
    
        titleLabel.text = items[index].title
        detailLabel.text = items[index].detail
        pageControl.currentPage = index
        
        self.titleLabel.alpha = 1.0
        self.detailLabel.alpha = 1.0
//      this reset position of view
        self.titleLabel.transform = .identity
        self.detailLabel.transform = .identity
    
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapAnimation(){
        
//        First Animation - title label
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }, completion: nil)
        }
        
//        Second animation - detail label
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.detailLabel.alpha = 0.8
            self.detailLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.detailLabel.alpha = 0
                self.detailLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }) { _ in
                
                self.currentPage += 1
                
                if self.isOverLastItem() {
//                    show main screen
                    self.showMainApp()
                } else {
                    self.setupScreen(index: self.currentPage)
                }
            }
        }
    }
    
    private func isOverLastItem() -> Bool{
        return currentPage == self.items.count
    }
    
    private func showMainApp(){
        let mainApp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainAppViewController")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = mainApp
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
        
    }
}

