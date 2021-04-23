//
//  Style+Buttons.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import UIKit

// MARK: - UIButton extension

extension UIButton {

    func setBackgroundImageToColor(_ color: UIColor, for state: UIControl.State) {
        let image = from(color: color)
        self.setBackgroundImage(image, for: state)
    }

    private func from(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
        }
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    func addBorder(_ color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }
}
