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
    
    private let currentPage: Int = 0
    
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
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapAnimation(){
        print("Tapped!")
    }
    
}

