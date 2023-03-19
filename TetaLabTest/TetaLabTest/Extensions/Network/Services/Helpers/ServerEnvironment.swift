//
//  ServerEnvironment.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

enum ServerEnvironment {
    case news

    var value: String {
        switch self {
        case .news:
            return "//newsapi.org/v2/top-headlines"
        }
    }
}
