//
//  NewsListViewControllerProtocol.swift
//  TetaLabTest
//
//  Created by MACsimus on 16.03.2023.
//

import UIKit
import SnapKit

protocol NewsListViewControllerProtocol: AnyObject {
    func reloadTableData()
}

class NewsListViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cell: NewsTableViewCell.self)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupNavigationBar()
        
        // Do any additional setup after loading the view.
    }

    func setupNavigationBar() {
        navigationItem.title = "News"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }

    private func setupTableView() {
        view.addSubview(newsTableView)

        newsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
    }

    func reloadTableData() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: "String text")
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension NewsListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension NewsListViewController: UISearchBarDelegate {

}
