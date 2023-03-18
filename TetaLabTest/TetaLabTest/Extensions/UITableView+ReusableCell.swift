//
//  UITableView+ReusableCell.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseID)
    }

    func dequeueCell<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: T.reuseID) as? T ?? T()
    }
}
