//
//  HomePresenter.swift
//  Airplane
//
//  Created by Marcos Avila Rodriguez on 09/02/22.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
}

class HomePresenter {
    
    weak var view: HomeView?
    var interactor: HomeUseCase
    var router: Homerouting
    
    init(view: HomeView, interactor: HomeUseCase, router: Homerouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        
    }
    
    
}
