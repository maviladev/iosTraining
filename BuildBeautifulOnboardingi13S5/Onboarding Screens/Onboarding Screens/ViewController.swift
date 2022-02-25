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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

