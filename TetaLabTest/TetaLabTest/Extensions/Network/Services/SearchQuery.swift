//
//  SearchQuery.swift
//  TetaLabTest
//
//  Created by MACsimus on 22.03.2023.
//

import Foundation

struct SearchQuery: Encodable {
    var q: String
    var country: String
    var apiKey: String
}
