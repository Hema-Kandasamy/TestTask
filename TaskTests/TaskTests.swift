//
//  TaskTests.swift
//  TaskTests
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import XCTest
@testable import Task

class TaskTests: XCTestCase {

    let session = MockURLSession()
    var vm: HomeViewModel?
    override func setUpWithError() throws {
        vm = HomeViewModel(with: self.session)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCount() {
        // Given
        let mockedData = MockRoot.responseData
        session.mockedResponsedata = mockedData
        let expectation = self.expectation(description: "count")
        var state = HomeViewState(responseCode: "", fetchCount: 0)
        let olderFetchCount = vm?.fetchCount ?? 0

        // When
        vm?.data.bind { (response) in
            expectation.fulfill()
            guard let data = response else {
                XCTFail()
                return
            }
            state = data
            print(state)
        }
        vm?.fetchData()
        waitForExpectations(timeout: 1, handler: nil)

        // Then
        XCTAssertNotNil(state)
        let newFetchCount = state.fetchCount
        XCTAssertNotNil(state.responseCode)
        XCTAssertEqual(state.responseCode, "9e49d810-3fd1-4b5e-abc6-0952532a966b")
        XCTAssertNotEqual(newFetchCount, olderFetchCount )
        XCTAssertEqual(newFetchCount, olderFetchCount + 1)
        XCTAssertTrue(newFetchCount > 0)
    }

    func testFetchInvalidData() {
        // Given
        let mockedData = MockInvalidData.responseData
        session.mockedResponsedata = mockedData
        let expectation = self.expectation(description: "invalidDataFailure")
        let state = HomeViewState(responseCode: "", fetchCount: 0)
        var errorDesc: String?
        // When
        vm?.error.bind({ (error) in
            errorDesc = error?.localizedDescription
            expectation.fulfill()
        })
        vm?.fetchData()
        waitForExpectations(timeout: 1, handler: nil)

        // Then
        XCTAssert(state.responseCode == "")
        XCTAssert(state.fetchCount == 0)
        XCTAssertNotNil(errorDesc)
    }

    func testEmptyData() {
        // Given
        // Not assigning mocked response
        let expectation = self.expectation(description: "emptyDataFailure")
        let state = HomeViewState(responseCode: "", fetchCount: 0)
        var errorDesc: String?

        // When
        vm?.error.bind({ (error) in
            errorDesc = error?.localizedDescription
            expectation.fulfill()
        })
        vm?.fetchData()
        waitForExpectations(timeout: 1, handler: nil)

        // Then
        XCTAssert(state.responseCode == "")
        XCTAssert(state.fetchCount == 0)
        XCTAssertNotNil(errorDesc)
    }

    func testCorrectAPIUrl() {
        // Given
        let mockedSession = self.session

        // When
        let baseURL = URL(string:"http://localhost")!
        //Then
        XCTAssertEqual(mockedSession.baseURL, baseURL)

    }

    func testInvalidAPIurl() {
        // Given
        let mockeSession = self.session

        // When
        let baseURl = URL(string: "http://google.com")!

        // Then
        XCTAssertNotEqual(mockeSession.baseURL, baseURl)
    }

}
