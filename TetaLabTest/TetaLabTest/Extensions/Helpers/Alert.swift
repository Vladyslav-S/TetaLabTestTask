//
//  Alert.swift
//  TetaLabTest
//
//  Created by MACsimus on 22.03.2023.
//

import UIKit

protocol AlertProtocol: AnyObject {
    func present(alert type: AlertType)
}

enum AlertType {
    case saved
}

extension AlertType {
    var title: String {
        switch self {
        case .saved:
            return "News has beed saved"
        }
    }
    var message: String {
        switch self {
        case .saved:
            return ""
        }
    }
}

extension UIViewController: AlertProtocol {
    func present(alert type: AlertType) {
        let alert = UIAlertController(title: type.title, message: type.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    func presentAlertAction(ofType type: AlertType, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: type.title, message: type.message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}
