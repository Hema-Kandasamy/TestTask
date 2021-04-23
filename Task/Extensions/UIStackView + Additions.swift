//
//  UIStackView + Additions.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import UIKit

/*final class VStackView: UIStackView {

    init(spacing: CGFloat = 16,
         alignment: Alignment = .fill
    ) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = .fill
        self.axis = .vertical
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


final class HStackView: UIStackView {

    init(spacing: CGFloat = 8,
         alignment: Alignment = .center
    ) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.alignment = alignment
        axis = .horizontal
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIStackView {

    func add(heading: String) {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Font.captionFont
        label.text = heading
        addArrangedSubview(label)
    }

    func add(title: String) {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = Font.captionFont
        titleLabel.text = title
        addArrangedSubview(titleLabel)
    }

    func add(text: String, textColor: UIColor = Color.darkerGrey) {
        let label = UILabel()
        label.font = Font.captionFont
        label.textColor = textColor
        label.text = text
        addArrangedSubview(label)
    }

    func addButton(with title: String, selector: Selector, target: Any? = nil) {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.titleLabel?.font = Font.captionFont
        button.setTitleColor(Color.darkerGrey, for: .normal)
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        addArrangedSubview(button)
    }

    func addButton(with image: UIImage) {
        let button = UIButton()
        button.setImage(image, for: .normal)
        addArrangedSubview(button)
    }

    func add(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        addArrangedSubview(imageView)
    }

    func add(title: String, body: String) {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = Font.titleFont
        titleLabel.text = title
        addArrangedSubview(titleLabel)

        let bodyLabel = UILabel()
        bodyLabel.numberOfLines = 0
        bodyLabel.font = Font.titleFont
        bodyLabel.text = body
        addArrangedSubview(bodyLabel)
    }

    func addSpacerView(for axis: NSLayoutConstraint.Axis) {
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: axis)
        addArrangedSubview(spacerView)
    }
} */
