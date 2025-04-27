//
//  UserListView.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//

import SwiftUI

struct UserListView: View {

    @StateObject var viewModel = UserListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: UserDetailView(username: user.login)) {
                    HStack {
                        AsyncImage(url: URL(string: user.avatar_url)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                        Text(user.login)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("GitHub Users")
            .task {
                await viewModel.fetchUsers()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                }
            }
        }
    }
}
