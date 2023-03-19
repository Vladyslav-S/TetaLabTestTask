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
    private var generalNewsData = GeneralNewsModel.empty
    private var viewModel: [GeneralNewsModel] = []
    private var cancellableSet: Set<AnyCancellable> = []
    weak var controller: NewsListViewControllerProtocol?


    func getViewModel(for index: IndexPath) -> GeneralNewsModel {
        guard index.isInRange(of: viewModel.count) else {
            return GeneralNewsModel.empty
        }
        return viewModel[index.row]
    }

    func fetchNews() {
        do {
            try newsNetworkService
                .getAllNews()
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
//            controller?.present(alert: .failedToLoadProfile)
        }
    }

    private func appendToViewModel(_ data: GeneralNewsViewModel) {
        let convertedNews = GeneralNewsModel(viewModel: data)
        viewModel.append(convertedNews)
    }

    private func handleReceivedNews(value: GeneralNewsViewModel) {
        appendToViewModel(value)
        controller?.reloadTableData()
    }
}
