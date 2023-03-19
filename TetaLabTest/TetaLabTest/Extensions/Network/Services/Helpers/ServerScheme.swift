//
//  ServerScheme.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

enum ServerScheme {
    case http
    case https
    case empty

    var value: String {
        switch self {
        case .http:
            return "http"
        case .https:
            return "https"
        case .empty:
            return ""
        }
    }
}
