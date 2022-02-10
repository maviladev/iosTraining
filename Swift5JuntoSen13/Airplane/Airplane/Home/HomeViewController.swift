//
//  HomeViewController.swift
//  Airplane
//
//  Created by Marcos Avila Rodriguez on 09/02/22.
//

import UIKit

protocol HomeView: class {
    
}

class HomeViewController: UIViewController {

    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension HomeViewController: HomeView {
    
}
