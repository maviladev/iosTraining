//
//  HomeAssembly.swift
//  Airplane
//
//  Created by Marcos Avila Rodriguez on 09/02/22.
//

import UIKit

class HomeAssembly {
    
    static func build() -> UIViewController {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let interactor = HomeInteractor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.view.backgroundColor = .orange
        
        
        return view
    }
}
