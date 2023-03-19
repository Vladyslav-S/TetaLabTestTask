//
//  Encodable+Queries.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import Foundation

extension Encodable {
    func convertToDictionary() throws -> [String: String] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try?
                JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: String] else {
                    throw NetworkError.EncodableExtensions.convertingToDictionaryFailed
        }
        return dictionary
    }

    func encodeData() throws -> Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            throw NetworkError.EncodableExtensions.dataEncodingFailed
        }
    }
}
