//
//  NewsURLs.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import Foundation

enum NewsURLs: URLBuilderProtocol {
    case topHeadlines(country: String, apiKey: String)

    var server: ServerBuilder {
        return .init(environment: .news)
    }

    var path: String {
        switch self {
        case .topHeadlines:
            return "/v2/top-headlines"
        }
    }

    var queries: Encodable? {
        switch self {
        case let .topHeadlines(country: country, apiKey: apiKey):
            return  NewsQuery(country: country, apiKey: apiKey)
        }
    }
}
