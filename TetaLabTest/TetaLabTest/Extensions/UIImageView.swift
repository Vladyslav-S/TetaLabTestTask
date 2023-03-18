//
//  UIImageView.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

extension UIImageView {
    func set(image picture: ImagesAssets?) {
        image = picture?.image
    }

    func setImage(from data: Data?) {
        if let avatarData = data {
            image = UIImage(data: avatarData)!
        }
    }
}
