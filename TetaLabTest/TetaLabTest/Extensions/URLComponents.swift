//
//  URLComponents.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
