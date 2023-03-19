//
//  UIImageResources.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

enum ImagesAssets {
    case defaultPhoto
    case savedNews
    case allNews

    var image: UIImage? {
        return UIImage(named: assetName)
    }

    var assetName: String {
        switch self {
        case .defaultPhoto:
            return "NoNewsPlaceholder"
        case .savedNews:
            return "Saved_news"
        case .allNews:
            return "Geleral_news"
        }
    }
}
