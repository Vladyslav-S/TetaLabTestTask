//
//  UIImageResources.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

enum ImagesAssets {
    case defaultPhoto

    var image: UIImage? {
        return UIImage(named: assetName)
    }

    var assetName: String {
        switch self {
        case .defaultPhoto:
            return "NoNewsPlaceholder"
        }
    }
}
