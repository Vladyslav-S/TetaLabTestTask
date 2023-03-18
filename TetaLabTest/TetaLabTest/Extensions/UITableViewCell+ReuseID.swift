//
//  UITableViewCell+ReuseID.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

extension UITableViewCell {
    static var reuseID: String {
        return NSStringFromClass(self)
    }
}
