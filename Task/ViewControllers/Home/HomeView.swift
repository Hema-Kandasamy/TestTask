//
//  HomeView.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import UIKit
import RxSwift
import RxSwiftExt
import RxCocoa

class HomeView: UIView {

    // MARK:- Properties
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private var responseLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.darkerGrey
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = Font.captionFont
        return label
    }()

    private var fetchCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.darkerGrey
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = Font.captionFont
        return label
    }()

    private var fetchContentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color.mediumGrey
        button.titleLabel?.font = Font.captionFont
        button.setTitleColor(Color.darkerGrey, for: .normal)
        button.setBackgroundImageToColor(Color.lightGrey, for: .normal)
        button.setBackgroundImageToColor(Color.mediumGrey, for: .highlighted)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        button.addBorder(Color.darkerGrey)
        button.setTitle("Fetch Content", for: .normal)
        return button
    }()

    var viewModel: HomeViewModel!
    private let disposeBag = DisposeBag()

    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commoninit() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentStackView)

        // Random insets given
       // let insets = UIEdgeInsets(top: 40, left: 20, bottom: 20, right: 20)
       // self.addWithInBounds(view: contentStackView, with: insets)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentStackView)
        NSLayoutConstraint.activate([contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     contentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     contentStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
                                     contentStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
                                     contentStackView.heightAnchor.constraint(equalToConstant: 200)])

        // This is to align content when we do not want them to fill. We could also set stack view height intead of insets
        let spacerView = UIView()

        let buttonContainerView = UIView()
        buttonContainerView.addSubview(fetchContentButton)
        buttonContainerView.addWithInBounds(view: fetchContentButton, with: UIEdgeInsets(top: 4, left: 50, bottom: 4, right: 50))

        [responseLabel, fetchCountLabel, buttonContainerView, spacerView]
            .forEach { contentStackView.addArrangedSubview($0) }
    }

    func bindFetchContentButton() {
        fetchContentButton.rx.tap.asObservable()
                  .bind(to: viewModel.fetchContentTapped)
              .disposed(by: disposeBag)
    }

    // MARK: - Render View
    func render(state: HomeViewState) {
        responseLabel.text = "Response Code : \(state.responseCode)"
        fetchCountLabel.text = "Fetch Count: \(state.fetchCount)"
    }


    // Update Error view
    func renderError(with error: String) {
         responseLabel.text = error
    }
}
