//
//  GitHubUserBrowserUITests.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//

import XCTest

final class GitHubUserBrowserUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testUserListScreenLoads() {
        let list = app.tables.firstMatch
        XCTAssertTrue(list.waitForExistence(timeout: 10), "User list should be visible")
    }

    func testNavigationToUserDetailScreen() {
        let firstCell = app.tables.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 10))
        firstCell.tap()

        let repoList = app.tables.firstMatch
        XCTAssertTrue(repoList.waitForExistence(timeout: 10), "Repo list should be visible after navigation")
    }
}
