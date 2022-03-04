//
//  Shadow.swift
//  PlatziFinanzas
//
//  Created by Marcos Avila Rodriguez on 04/03/22.
//

import UIKit

extension UIView {
    var borderUIColor: UIColor {
        get {
            guard let color = layer.borderColor else {
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
