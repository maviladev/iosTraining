//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Marcos Avila Rodriguez on 17/02/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
