//
//  NewsListPresenter.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import Foundation
import Combine

class NewsListPresenter {
    private let newsNetworkService = NewsNetworkService()
    private var newsData = NewsViewModel.empty
    private var viewModel = GeneralNewsViewModel.empty
    private var cancellableSet: Set<AnyCancellable> = []
    weak var controller: NewsListViewControllerProtocol?

    var newsCount: Int {
        return viewModel.articles.count
    }

    func getViewModel(for index: IndexPath) -> NewsViewModel {
        guard index.isInRange(of: viewModel.articles.count) else {
            return NewsViewModel.empty
        }
        return viewModel.articles[index.row]
    }

    func fetchNews() {
        do {
            try newsNetworkService
                .getAllNews(country: "ua", apiKey: Localizable.Network.apiKey)
                .sink(receiveCompletion: { error in
                    if case .failure = error {
                        print(error)
                        print("Failed to load news")
                    }
                }, receiveValue: { value in
                    self.handleReceivedNews(value: value)

                })
                .store(in: &cancellableSet)
        } catch {
            print("failed to load news afte storing it")
        }
    }

    private func handleReceivedNews(value: GeneralNewsViewModel) {
        viewModel = value
        controller?.reloadTableData()
    }
}
