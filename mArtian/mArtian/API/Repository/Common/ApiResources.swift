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

    func path(parameters: [String: String]?) -> URL? {
        let builder = UrlBuilder()
            .set(component: .scheme(API.scheme))
            .set(component: .host(API.host))
        switch self {
        case .users:
            _ = builder.set(component: .path(API.Endpoint.users))
            break
        case .posts:
            _ = builder.set(component: .path(API.Endpoint.posts))
            break
        case .comments:
            _ = builder.set(component: .path(API.Endpoint.comments))
            break
        case .albums:
            _ = builder.set(component: .path(API.Endpoint.users))
            break
        case .todos:
            _ = builder.set(component: .path(API.Endpoint.todos))
            break
        }
        _ = builder.set(component: .parameters(parameters))
        return builder.build()
    }
}

private struct API {
    static let scheme = "https"
    static let host = "demo.martian.services"
    struct Endpoint {
        static let users: String = "/api/users"
        static let posts: String = "/api/posts"
        static let comments: String = "/api/comments"
        static let albums: String = "/api/albums"
        static let todos: String = "/api/todos"
    }
}
