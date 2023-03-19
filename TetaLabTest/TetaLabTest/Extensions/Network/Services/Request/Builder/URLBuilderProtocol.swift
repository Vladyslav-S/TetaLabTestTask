//
//  URLBuilderProtocol.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

protocol URLBuilderProtocol {
    var server: ServerBuilder { get }
    var path: String { get }
    var queries: Encodable? { get }

    func getURL() throws -> URL
}

extension URLBuilderProtocol {
    func getURL() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = server.scheme.value
        urlComponents.host = server.host.value
        urlComponents.path = path

        if let queries = try queries?.convertToDictionary() {
            urlComponents.setQueryItems(with: queries)
        }

        guard let finalURL = urlComponents.url else {
            throw NetworkError.URLConstruction.invalidFinalURL
        }
        return finalURL
    }
}
