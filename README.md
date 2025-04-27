
# GitHub User Browser App

An iOS application built with SwiftUI that allows users to browse GitHub users and view their repositories.

## Features

- **User List Screen**
  - Displays a list of GitHub users
  - Shows profile picture and username
  - Tapping a user navigates to their details and repositories

- **User Repository Screen**
  - Shows user details: avatar, username, full name, followers, and following
  - Lists non-forked repositories with name, language, star count, and description
  - Tapping a repository opens it in a WebView

## Technical Details

- **Architecture:** MVVM (Model-View-ViewModel)
- **UI Framework:** SwiftUI
- **Networking:** URLSession with async/await
- **Authentication:** GitHub Personal Access Token to avoid rate limits
- **Testing:**
  - Unit Tests for API Services
  - UI Tests for navigation flow

## Requirements

- iOS 16.0+
- Xcode 15+
- Swift 5.9+

## Setup Instructions

1. Clone the repository or download the project zip.
2. Insert your GitHub Personal Access Token in `GitHubAPIService.swift`:
   ```swift
   private let token = "YOUR_GITHUB_TOKEN_HERE"
   ```
3. Build and run the project in Xcode.
