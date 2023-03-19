//
//  ServerBuilder.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

protocol ServerBuilderProtocol {
    var scheme: ServerScheme { get }
    var host: ServerEnvironment { get }
}

struct ServerBuilder: ServerBuilderProtocol {
    var environment: ServerEnvironment

    var scheme: ServerScheme {
        switch environment {
        case .news:
            return .https
        }
    }

    var host: ServerEnvironment {
        switch environment {
        case .news:
            return .news
        }
    }

    init(environment: ServerEnvironment) {
        self.environment = environment
    }
}
