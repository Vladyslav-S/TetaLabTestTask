//
//  UIView.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit

extension UIView {
    func defaultViewRoundedStyle() {
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
    }

    func defaultButtonRoundedStyle(buttonEnabled state: Bool) {
        switch state {
        case true:
            self.backgroundColor = .blue
            self.translatesAutoresizingMaskIntoConstraints = false
            self.layer.cornerRadius = 8
            self.clipsToBounds = true
        case false:
            self.backgroundColor = .gray
            self.translatesAutoresizingMaskIntoConstraints = false
            self.layer.cornerRadius = 8
            self.clipsToBounds = true
        }
    }

    func apply(shadow: ShadowType) {
        layer.shadowColor = shadow.color
        layer.shadowOffset = shadow.offset
        layer.shadowOpacity = shadow.opacity
        layer.shadowRadius = shadow.radius
    }

//    func apply(cornerRadius: CGFloat) {
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = false
//    }
//
//    convenience init(with side: Int) {
//        self.init(frame: CGRect(x: 0, y: 0, width: side, height: side))
//    }
}
