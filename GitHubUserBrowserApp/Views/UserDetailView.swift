//
//  UserDetailView.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//

import SwiftUI

struct UserDetailView: View {

    let username: String
    @StateObject var viewModel = UserDetailViewModel()

    var body: some View {
        List {
            if let details = viewModel.userDetails {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: details.avatar_url)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())

                    Text(details.login).font(.title2)
                    if let name = details.name {
                        Text(name).font(.headline)
                    }
                    Text("Followers: \(details.followers)")
                    Text("Following: \(details.following)")
                }
            }

            Section(header: Text("Repositories")) {
                ForEach(viewModel.repos) { repo in
                    NavigationLink(destination: SafariWebView(url: URL(string: repo.html_url)!)) {
                        VStack(alignment: .leading) {
                            Text(repo.name).bold()
                            Text(repo.language ?? "Unknown Language").font(.subheadline)
                            Text("⭐️ \(repo.stargazers_count)")
                            if let description = repo.description {
                                Text(description).font(.footnote)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(username)
        .task {
            await viewModel.fetchDetails(for: username)
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
