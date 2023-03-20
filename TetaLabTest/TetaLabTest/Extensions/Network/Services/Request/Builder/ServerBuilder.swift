//
//  ServerBuilder.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

protocol ServerBuilderProtocol {
    var scheme: ServerScheme { get }
    var host: ServerHost { get }
}

struct ServerBuilder: ServerBuilderProtocol {
    var environment: ServerHost

    var scheme: ServerScheme {
        switch environment {
        case .news:
            return .https
        }
    }

    var host: ServerHost {
        switch environment {
        case .news:
            return .news
        }
    }

    init(environment: ServerHost) {
        self.environment = environment
    }
}
