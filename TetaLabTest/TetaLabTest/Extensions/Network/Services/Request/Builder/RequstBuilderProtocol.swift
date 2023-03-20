//
//  RequstBuilderProtocol.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

protocol RequestBuilderProtocol: AnyObject {
    var url: URLBuilderProtocol { get set }

    var httpMethod: HTTPMethod { get }
    var header: HeaderType { get }
    var body: Encodable? { get set }
    var uploadData: Data? { get set }
    var fileExt: String { get set }
    var fileContentType: String { get set }
    func getRequest() throws -> URLRequest
}

extension RequestBuilderProtocol {
    func getRequest() throws -> URLRequest {
        let url = try url.getURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.value

        switch header {
        case .standard:
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        case .empty:
            break
        }

        if let body = body {
            do {
                let data = try body.encodeData()
                urlRequest.httpBody = data
            } catch {
                throw NetworkError.RequestConstruction.addingBodyFailed
            }
        }
        return urlRequest
    }

//    func getUploadRequest() throws -> (request: URLRequest, data: Data?) {
//        let url = try url.getURL()
//        var urlRequest = URLRequest(url: url)
//        let boundary = UUID().uuidString
//        urlRequest.httpMethod = httpMethod.value
//
//        switch header {
//        case .standard, .empty: break
//        }
//
//        if let body = body {
//            do {
//                let data = try body.encodeData()
//                urlRequest.httpBody = data
//            } catch {
//                throw NetworkError.RequestConstruction.addingBodyFailed
//            }
//        }
//        var data: Data?
//        if let uploadData = uploadData {
//            data = Data()
//            data?.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//            data?.append("Content-Disposition: form-data; filename=\"\(UUID().uuidString + "." + fileExt)\"\r\n".data(using: .utf8)!)
//            data?.append("Content-Type: \(fileContentType)\r\n\r\n".data(using: .utf8)!)
//            data?.append(uploadData)
//            data?.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
//        }
//        return (urlRequest, data)
//    }
}
