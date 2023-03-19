//
//  HTTPResponce.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

struct HTTPResponse<T: Decodable> {
    let value: T
    let response: URLResponse
}
