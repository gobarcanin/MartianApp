//
//  ApiResources.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

enum ApiResources: String {
    case users
    case posts
    case comments
    case albums
    case todos

    var path: String {
        switch self {
        case .users: return ApiPaths.users
        case .posts: return ApiPaths.posts
        case .comments: return ApiPaths.comments
        case .albums: return ApiPaths.albums
        case .todos: return ApiPaths.todos
        }
    }
}

private struct ApiPaths {
    private static let baseUrl = "https://demo.martian.services/api/"
    static let users: String = "\(baseUrl)/users"
    static let posts: String = "\(baseUrl)/posts"
    static let comments: String = "\(baseUrl)/comments"
    static let albums: String = "\(baseUrl)/albums"
    static let todos: String = "\(baseUrl)/todos"
}
