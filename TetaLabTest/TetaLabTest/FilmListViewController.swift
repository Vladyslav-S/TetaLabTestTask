//
//  FilmListViewController.swift
//  TetaLabTest
//
//  Created by MACsimus on 16.03.2023.
//

import UIKit
import SnapKit

protocol FilmListViewControllerProtocol: AnyObject {
    func reloadTableData()
}

class FilmListViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var filmsTableView: UITableView = {
        let tableView = UITableView()
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
        navigationItem.title = "Films"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }

    private func setupTableView() {
        view.addSubview(filmsTableView)

        filmsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
    }

    func reloadTableData() {
        DispatchQueue.main.async {
            self.filmsTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension FilmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

// MARK: - UITableViewDelegate

extension FilmListViewController: UITableViewDelegate {

}

extension FilmListViewController: UISearchBarDelegate {

}
