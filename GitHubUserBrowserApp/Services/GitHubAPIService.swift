//
//  GitHubAPIService.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//

import Foundation

class GitHubAPIService {

    static let shared = GitHubAPIService()
    private let baseURL = "https://api.github.com"

    // TODO: add your token here
    private let token = ""

    private func makeRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        return request
    }

    func fetchUsers() async throws -> [GitHubUser] {
        let url = URL(string: "\(baseURL)/users")!
        let (data, _) = try await URLSession.shared.data(for: makeRequest(url: url))
        return try JSONDecoder().decode([GitHubUser].self, from: data)
    }

    func fetchUserDetails(username: String) async throws -> GitHubUserDetails {
        let url = URL(string: "\(baseURL)/users/\(username)")!
        let (data, _) = try await URLSession.shared.data(for: makeRequest(url: url))
        return try JSONDecoder().decode(GitHubUserDetails.self, from: data)
    }

    func fetchUserRepos(username: String) async throws -> [GitHubRepo] {
        let url = URL(string: "\(baseURL)/users/\(username)/repos")!
        let (data, _) = try await URLSession.shared.data(for: makeRequest(url: url))
        return try JSONDecoder().decode([GitHubRepo].self, from: data)
    }
}
