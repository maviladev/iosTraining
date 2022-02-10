//
//  HomeViewController.swift
//  Airplane
//
//  Created by Marcos Avila Rodriguez on 09/02/22.
//

import UIKit

protocol HomeView: class {
    func update(dto: [UserResult])
}

class HomeViewController: UIViewController {

    var presenter: HomePresenter?
    
    var userData: [UserResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.presenter?.viewDidLoad()
    }


}

extension HomeViewController: HomeView {
    func update(dto: [UserResult]) {
        userData = dto
        
        userData.forEach { (user) in
            if let userMail = user.email {
                print(userMail)
            }
            
        }
    }
    
    
}
