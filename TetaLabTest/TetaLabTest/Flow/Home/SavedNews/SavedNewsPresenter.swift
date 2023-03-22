//
//  SavedNewsPresenter.swift
//  TetaLabTest
//
//  Created by MACsimus on 19.03.2023.
//

import UIKit

class SavedNewsPresenter {

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var viewModel = GeneralNewsViewModel(status: "1", totalResults: 1, articles: [])
    private var models = [NewsListItem]()

    var newsCount: Int {
        return models.count
    }

    var allCoreModels: [NewsListItem] {
        return models
    }

    func getAllItems() {
        do {
            models = try context.fetch(NewsListItem.fetchRequest())
        } catch {
            // errors
        }
    }

    func deleteItem(item: NewsListItem) {
        context.delete(item)
        do {
            try context.save()
        } catch {

        }
    }
}
