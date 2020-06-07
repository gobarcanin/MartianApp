//
//  DefaultRepositoryFactory.swift
//  mArtian
//
//  Created by Goran Obarcanin on 06/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

protocol RepositoryFactory {
    var userRepository: UserRepository { get }
    var postsRepository: PostsRepository { get }
    var commentsRepository: CommentsRepository { get }
}

struct DefaultRepositoryFactory: RepositoryFactory {
    let userRepository: UserRepository
    let postsRepository: PostsRepository
    let commentsRepository: CommentsRepository

    init() {
        self.userRepository = DefaultUserRepository()
        self.postsRepository = DefaultPostsRepository()
        self.commentsRepository = DefaultCommentsRepository()
    }
}
