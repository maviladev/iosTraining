//
//  ViewController.swift
//  HolidayApp
//
//  Created by Marcos Avila Rodriguez on 02/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var darkView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func setupViews(){
        getStartedButton.layer.cornerRadius = 28
        getStartedButton.layer.masksToBounds = true
    }
    
    @IBAction func getStartedButtonTapped(_ sender: Any) {
        
    }
}

