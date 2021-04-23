//
//  HomeViewController.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK:- Properties
    var mainView: HomeView!
    var viewModel: HomeViewModel?

    override func loadView() {
        mainView = HomeView()
        mainView.backgroundColor = .white
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up viewModel, this usually can be injected or set when we have flow
        self.viewModel = HomeViewModel(with: NetworkSession())
        mainView.viewModel = self.viewModel
        configDataBinding()
        configErrorBinding()
        mainView.bindFetchContentButton() // Only for button, using Rxswift
        viewModel?.fetchData()
    }

    // Data Binding
    private func configDataBinding() {
        viewModel?.data.bind{ [weak self] state in
            guard let state = state else { return }
            DispatchQueue.main.async {
                self?.mainView.render(state: state)
            }
        }
    }

    private func configErrorBinding() {
        viewModel?.error.bind { error in
            DispatchQueue.main.async {
                self.mainView.renderError(with: error?.localizedDescription ?? "Error occerred")
            }
        }
    }

}

