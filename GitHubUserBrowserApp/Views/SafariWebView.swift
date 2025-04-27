//
//  SafariWebView.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//


import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
