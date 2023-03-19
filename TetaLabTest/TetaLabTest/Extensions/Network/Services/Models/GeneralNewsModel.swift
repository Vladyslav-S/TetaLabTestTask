//
//  GeneralNewsModel.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation

struct GeneralNewsModel {
    let status: String
    let totalResults: Int
    let articles: [GeneralNewsViewModel]
}

struct GeneralNewsViewModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [GeneralNewsViewModel]
}

struct NewsViewModel: Decodable {
    let source: [Source]

    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

}

struct Source: Decodable {
    let id: String
    let name: String
}

extension GeneralNewsModel {
    init(viewModel: GeneralNewsViewModel) {
        self.init(
            status: viewModel.status,
            totalResults: viewModel.totalResults,
            articles: viewModel.articles ?? [])
    }
}

extension GeneralNewsModel {
    static let empty: Self = .init(
        status: "Empty status",
        totalResults: 0,
        articles: [])
}
