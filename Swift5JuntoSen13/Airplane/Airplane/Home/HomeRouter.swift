//
//  HomeRouter.swift
//  Airplane
//
//  Created by Marcos Avila Rodriguez on 09/02/22.
//

import Foundation
import UIKit


protocol Homerouting {
    
}

class HomeRouter {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
}

extension HomeRouter: Homerouting {
    
}
