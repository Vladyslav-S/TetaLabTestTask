//
//  NewsWebView.swift
//  TetaLabTest
//
//  Created by MACsimus on 20.03.2023.
//

import UIKit
import WebKit

class NewsWebViewController: UIViewController, WKNavigationDelegate {
    let presenter = NewsWebViewPresenter()
    var webView: WKWebView!

    override func viewDidLoad() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView

        getUrl()
    }

    private func getUrl() {
        let url = presenter.getUrl
        webView.load(URLRequest(url: URL(string: url)!))
        webView.allowsBackForwardNavigationGestures = true
    }
}
