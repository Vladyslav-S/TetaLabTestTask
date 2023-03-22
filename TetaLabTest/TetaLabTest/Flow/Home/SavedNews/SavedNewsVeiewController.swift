//
//  SavedNewsVeiewController.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import UIKit

class SavedNewsVeiewController: UIViewController {

    private let presenter = SavedNewsPresenter()

    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cell: NewsTableViewCell.self)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        setupTableView()
        getData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.newsTableView.reloadData()
    }

    private func getData() {
        presenter.getAllItems()
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }

    private func setupTableView() {
        view.addSubview(newsTableView)

        newsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.bottom.equalToSuperview()
        }
    }

    private func presentNewsWebViewController(with url: String) {
        let viewController = NewsWebViewController()
        viewController.presenter.set(url: url)
        navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.present(viewController, animated: true)
    }
}

extension SavedNewsVeiewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.newsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let model = presenter.allCoreModels[indexPath.row]
        cell.setup(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            // 1. remove object from your array
            let model = self.presenter.allCoreModels[indexPath.row]
            self.presenter.deleteItem(item: model)
            // 2. reload the table, otherwise you get an index out of bounds crash
            self.newsTableView.reloadData()

            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = presenter.allCoreModels[indexPath.row]
        presentNewsWebViewController(with: viewModel.url ?? "www.apple.com")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
