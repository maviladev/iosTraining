//
//  OnboardingContainerViewController.swift
//  PlatziFinanzas
//
//  Created by Marcos Avila Rodriguez on 04/03/22.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue .identifier == "openOnboarding", let destination = segue.destination as? OnboardingViewController else {
            return
        }
        destination.pageControl = pageControl
    }
}
