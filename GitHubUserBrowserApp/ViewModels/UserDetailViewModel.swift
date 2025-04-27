//
//  UserDetailViewModel.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//

import Foundation

@MainActor
class UserDetailViewModel: ObservableObject {

    @Published var userDetails: GitHubUserDetails?
    @Published var repos: [GitHubRepo] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchDetails(for username: String) async {
        isLoading = true
        do {
            async let userDetails = GitHubAPIService.shared.fetchUserDetails(username: username)
            async let repos = GitHubAPIService.shared.fetchUserRepos(username: username)
            self.userDetails = try await userDetails
            self.repos = try await repos.filter { !$0.fork }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
