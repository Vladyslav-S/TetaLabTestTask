//
//  IndexPath+Range.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

extension IndexPath {
    func isInRange(of number: Int) -> Bool {
        (row ..< number).contains(row)
    }
}
