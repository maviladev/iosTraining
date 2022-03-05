//
//  OnboardingViewController.swift
//  PlatziFinanzas
//
//  Created by Marcos Avila Rodriguez on 04/03/22.
//

import UIKit

struct OnboardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnboardingViewController: UIPageViewController {

     var pageControl: UIPageControl?
    
    fileprivate (set) lazy var items: [OnboardingItem] = {
        return [
            OnboardingItem(title: "Save money and reduce debt", description: "Press the start button", imageName: "OnBoarding1"),
            OnboardingItem(title: "You've finished your onboarding", description: "Press the start button", imageName: "OnBoarding2")
        ]
    }()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
       var items = [UIViewController]()
        for i in 0..<self.items.count {
            items.append(self.instantViewController(i))
        }
        return items
    }()
    
    private func instantViewController(_ index: Int) -> UIViewController {
        guard let viewController = UIStoryboard(name: "Onboarding", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnboardingSteps") as? OnboardingStepsViewController else {
            return UIViewController()
        }
        viewController.item = items[index]
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
        dataSource = self
    }
    

    
//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.firstIndex(of: viewController)
        if index == 0 {
            return nil
        } else {
            return contentViewController[index! - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == contentViewController.count - 1 {
            return nil
        } else {
            return contentViewController[index! + 1]
        }
    }
    
    
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    
}
