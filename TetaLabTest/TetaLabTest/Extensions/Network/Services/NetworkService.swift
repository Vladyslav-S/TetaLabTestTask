//
//  NetworkService.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    var session: URLSession { get }
}

extension NetworkServiceProtocol {
    var session: URLSession {
        return URLSession.shared
    }

    func performDataTask<T: Decodable>(
        with request: URLRequest,
        decoder: JSONDecoder = .init(),
        queue: DispatchQueue = .main,
        retries: Int = 0
    ) -> AnyPublisher<HTTPResponse<T>, Error> {
        session.dataTaskPublisher(for: request)
            .retry(retries)
            .tryMap { result -> HTTPResponse<T> in
                let dataString = String(data: result.data, encoding: .utf8) ?? ""
                print("Response data: \(dataString)")
                print("Response: \(result.response)")
                let data = try decoder.decode(T.self, from: result.data)
                return HTTPResponse(value: data, response: result.response)
            }
            .receive(on: queue)
            .eraseToAnyPublisher()
    }

    func performDataTaskNoResponse(
        with request: URLRequest,
        decoder: JSONDecoder = .init(),
        queue: DispatchQueue = .main,
        retries: Int = 0
    ) -> AnyPublisher<Void, Error> {
        session.dataTaskPublisher(for: request)
            .retry(retries)
            .tryMap { result in
                let dataString = String(data: result.data, encoding: .utf8) ?? ""
                print("Response: \(result.response)")
            }
            .receive(on: queue)
            .eraseToAnyPublisher()
    }

    func performUploadTask(
        with request: URLRequest,
        data: Data?,
        decoder: JSONDecoder = .init()
    ) async throws {
        try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, Error>) in
            let task = session.uploadTask(with: request, from: data) { data, response, error in
                guard error == nil else {
                    continuation.resume(
                        throwing: error!
                    )
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    continuation.resume(
                        throwing: NetworkError.UploadTask.noResponse
                    )
                    return
                }
                guard response.statusCode == 200 else {
                    continuation.resume(
                        throwing: NetworkError.UploadTask.badServerResponse(
                            statusCode: response.statusCode
                        )
                    )
                    return
                }
                print("Response: \(response)")
                continuation.resume(returning: ())
            }
            task.resume()
        })
    }
}
