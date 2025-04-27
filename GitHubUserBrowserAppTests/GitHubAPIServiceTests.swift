//
//  GitHubAPIServiceTests.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//


import XCTest

@testable import GitHubUserBrowserApp

final class GitHubAPIServiceTests: XCTestCase {

    func testFetchUsers() async throws {
        let users = try await GitHubAPIService.shared.fetchUsers()
        XCTAssertFalse(users.isEmpty, "Users list should not be empty")
    }

    func testFetchUserDetails() async throws {
        let userDetails = try await GitHubAPIService.shared.fetchUserDetails(username: "octocat")
        XCTAssertEqual(userDetails.login, "octocat", "Should fetch details for octocat")
    }

    func testFetchUserRepos() async throws {
        let repos = try await GitHubAPIService.shared.fetchUserRepos(username: "octocat")
        XCTAssertFalse(repos.isEmpty, "Repos list should not be empty")
    }
}
