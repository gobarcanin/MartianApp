//
//  Post.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

protocol Post: ApiParameter {
    var userId: Int { get }
    var id: Int { get }
    var title: String { get }
    var body: String { get }
}

struct DefaultPost: Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct MappedPost: Post {
    typealias Post = DefaultPost
    var userId: Int
    var id: Int
    var title: String
    var body: String
    var user: User?
    init(with default: Post, user: User?) {
        self.userId = `default`.userId
        self.id = `default`.id
        self.title = `default`.title
        self.body = `default`.body
        self.user = user
    }
}
