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

    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        guard let loadedImage = UIImage(data: imageData) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.image = loadedImage
        }
    }
}
