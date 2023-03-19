//
//  RequestCreator.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

class RequestCreator: RequestBuilderProtocol {
    var url: URLBuilderProtocol
    let httpMethod: HTTPMethod
    let header: HeaderType
    var body: Encodable?
    var uploadData: Data?
    var fileExt: String
    var fileContentType: String

    init(
        url: URLBuilderProtocol,
        httpMethod: HTTPMethod,
        header: HeaderType,
        body: Encodable? = nil,
        uploadData: Data? = nil,
        fileExt: String = "png",
        fileContentType: String = "image/png"
    ) {
        self.url = url
        self.httpMethod = httpMethod
        self.header = header
        self.body = body
        self.uploadData = uploadData
        self.fileExt = fileExt
        self.fileContentType = fileContentType
    }
}
