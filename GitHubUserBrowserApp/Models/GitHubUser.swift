//
//  GitHubUser.swift
//  GitHubUserBrowserApp
//
//  Created by ShujaMBP on 27/04/2025.
//

import Foundation

struct GitHubUser: Identifiable, Codable {

    let id: Int
    let login: String
    let avatar_url: String
}

struct GitHubRepo: Identifiable, Codable {

    let id: Int
    let name: String
    let language: String?
    let stargazers_count: Int
    let description: String?
    let fork: Bool
    let html_url: String
}

struct GitHubUserDetails: Codable {

    let avatar_url: String
    let login: String
    let name: String?
    let followers: Int
    let following: Int
}
