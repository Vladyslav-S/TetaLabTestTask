//
//  ServerEnvironment.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

enum ServerHost {
    case news

    var value: String {
        switch self {
        case .news:
            return "newsapi.org"
        }
    }
}
