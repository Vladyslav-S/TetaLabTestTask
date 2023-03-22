//
//  NewsWebViewPresenter.swift
//  TetaLabTest
//
//  Created by MACsimus on 20.03.2023.
//

import Foundation

class NewsWebViewPresenter {
    private var urlToOpen = "https://www.apple.com"

    var getUrl: String {
        return urlToOpen
    }

    func set(url: String) {
        self.urlToOpen = url
    }
}
