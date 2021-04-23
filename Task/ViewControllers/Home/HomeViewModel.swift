//
//  HomeViewModel.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// ViewState
struct HomeViewState {
    let responseCode: String
    let fetchCount: Int
}

enum ServerRequestStatus: Int {
    case none
    case started
    case ended
}

class HomeViewModel {

    // MARK: Properties

    // RxSwift is used only for this button to show, Others follow MVVM binding logic
    let fetchContentTapped = PublishSubject<Void>()
    private let disposeBag = DisposeBag()

    private var session: NetworksessionProtocol!
    var data = Dynamic<HomeViewState?>(nil)
    var error = Dynamic<Error?>(nil)
    var status: Dynamic<ServerRequestStatus> = Dynamic(ServerRequestStatus.none) // We can use this to load activity indicator

    private(set) var fetchCount: Int = 0

    // Init
    init(with session: NetworksessionProtocol) {
        self.session = session
        fetchContentTapped
        .subscribe(
            onNext: { [weak self] in
                self?.fetchData()
            }
        ).disposed(by: disposeBag)
    }

    // Fetch Data Methods
    func fetchData() {
        let request = APIRequest(resource: RootRequestResource())
        session.enqueue(networkRequest: request) { [weak self] result in
            guard let strongSelf = self else { return }

            do {
                let data = try result.get()
                strongSelf.getContent(with: data.nextPath) { state in
                    strongSelf.data.value = state
                }
            }
            catch {
                self?.error.value = error
            }
        }
    }

    func getContent(with urlString: String, completion: @escaping (HomeViewState) -> Void) {
        let request =  APIRequest(resource: ContentRequestResource(urlString: urlString))
        session.enqueue(networkRequest: request) { [weak self] result in
            guard let strongSelf = self else { return }
            do {
                let response =  try result.get()
                strongSelf.fetchCount += 1
                let state = HomeViewState(
                    responseCode: response.responseCode,
                    fetchCount: strongSelf.fetchCount)
                completion(state)
            }
            catch {
                self?.error.value = error
            }

        }
    }
}
