//
//  ShadowType.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

enum ShadowType {
    case basic
    case alert
    case noShadow
    case blue

    var color: CGColor {
        switch self {
        case .basic:
            return UIColor.black.cgColor
        case .alert:
            return UIColor.red.cgColor
        case .noShadow:
            return UIColor.clear.cgColor
        case .blue:
            return UIColor.blue.cgColor
        }
    }
    var offset: CGSize {
        switch self {
        case .basic,.alert,.noShadow,.blue:
            return .zero
        }
    }
    var opacity: Float {
        switch self {
        case .basic:
            return 0.2
        case .alert:
            return 1
        case .noShadow:
            return 0
        case .blue:
            return 0.5
        }
    }
    var radius: CGFloat {
        switch self {
        case .basic,.alert,.noShadow,.blue:
            return 3
        }
    }
}
