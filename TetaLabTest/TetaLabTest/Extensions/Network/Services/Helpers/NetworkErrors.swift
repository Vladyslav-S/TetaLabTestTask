//
//  NetworkErrors.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

struct NetworkError {
    enum URLConstruction: Error {
        case invalidQueries
        case invalidFinalURL
    }

    enum RequestConstruction: Error {
        case addingBodyFailed
    }

    enum EncodableExtensions: Error {
        case convertingToDictionaryFailed
        case dataEncodingFailed
    }

    enum DataTask: Error {
        case badServerResponse
    }

    enum UploadTask: Error {
        case noResponse
        case respondedWithNoData
        case badServerResponse(statusCode: Int)
    }
}
