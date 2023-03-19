//
//  StartTabBarViewController.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import UIKit

class StartTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }

    private func setupVCs() {
        viewControllers = [
            createNavController(for: NewsListViewController(), title: "News", image: UIImage(systemName: "house.fill")),
            createNavController(for: SavedNewsVeiewController(), title: "Saved", image: UIImage(systemName: "opticaldiscdrive.fill"))
        ]
    }

    private func createNavController(for rootViewController: UIViewController,
                                     title: String,
                                     image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
