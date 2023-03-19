//
//  NewsNetworkService.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation
import Combine

protocol NewsNetworkServiceProtocol {
    func getAllNews() throws -> AnyPublisher<GeneralNewsViewModel, Error>
}

class NewsNetworkService: NetworkServiceProtocol, NewsNetworkServiceProtocol {
    func getAllNews() throws -> AnyPublisher<GeneralNewsViewModel, Error> {
        let getAllNewsRequest = try RequestCreator(
            url: NewsURLs.ukrainianNews,
            httpMethod: .get,
            header: .standard
        ).getRequest()

        return performDataTask(with: getAllNewsRequest, retries: 3)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
