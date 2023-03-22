//
//  NewsURLs.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import Foundation

enum NewsURLs: URLBuilderProtocol {
    case topHeadlines(country: String, apiKey: String)
    case searchedUsers(name: String, country: String, apiKey: String)

    var server: ServerBuilder {
        return .init(environment: .news)
    }

    var path: String {
        switch self {
        case .topHeadlines, .searchedUsers:
            return "/v2/top-headlines"
        }
    }

    var queries: Encodable? {
        switch self {
        case let .topHeadlines(country: country, apiKey: apiKey):
            return  NewsQuery(country: country, apiKey: apiKey)
        case let .searchedUsers(name: name, country: country, apiKey: apiKey):
            return SearchQuery(q: name, country: country, apiKey: apiKey)
        }
    }
}
