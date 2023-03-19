//
//  HTTPMethod.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete

    var value: String? {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
