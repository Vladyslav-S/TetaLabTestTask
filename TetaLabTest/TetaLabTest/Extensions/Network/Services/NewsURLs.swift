//
//  NewsURLs.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import Foundation

enum NewsURLs: URLBuilderProtocol {
    case ukrainianNews

    var server: ServerBuilder {
        return .init(environment: .news)
    }

    var path: String {
        switch self {
        case .ukrainianNews:
            return "ua"
        }
    }

    var queries: Encodable? {
        switch self {
        case .ukrainianNews:
            return nil
        }
    }
}
