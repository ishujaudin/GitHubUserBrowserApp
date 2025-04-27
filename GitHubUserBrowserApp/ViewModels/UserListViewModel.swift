//
//  UserListViewModel.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//


import Foundation

@MainActor
class UserListViewModel: ObservableObject {

    @Published var users: [GitHubUser] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchUsers() async {
        isLoading = true
        do {
            users = try await GitHubAPIService.shared.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
