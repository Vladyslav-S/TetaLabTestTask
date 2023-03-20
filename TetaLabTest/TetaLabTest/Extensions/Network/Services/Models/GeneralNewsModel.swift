//
//  GeneralNewsModel.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

struct GeneralNewsViewModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsViewModel]
}

struct NewsViewModel: Decodable {
    let source: Source

    let author: String
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?

}

struct Source: Decodable {
    let id: String
    let name: String
}

extension Source {
    static let empty: Self = .init(id: "", name: "")
}

extension NewsViewModel {
    static let empty: Self = .init(source: Source.empty,
                                   author: "",
                                   title: "",
                                   description: "",
                                   url: "",
                                   urlToImage: "",
                                   publishedAt: "",
                                   content: "")
}

extension GeneralNewsViewModel {
    static let empty: Self = .init(status: "",
                                   totalResults: 0,
                                   articles: [])
}
