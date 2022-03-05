//
//  OnboardingStepsViewController.swift
//  PlatziFinanzas
//
//  Created by Marcos Avila Rodriguez on 04/03/22.
//

import UIKit



class OnboardingStepsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onboardingImage: UIImageView!
    
    var item: OnboardingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onboardingImage.image = UIImage(named: item?.imageName ?? "")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
