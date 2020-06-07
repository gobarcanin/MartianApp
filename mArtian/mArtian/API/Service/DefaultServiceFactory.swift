//
//  DefaultServiceFactory.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

protocol ServiceFactory {
    var services: Services { get }
}

struct Services {
    let usersService: UsersService
    let postsService: PostsService
    let commentsService: CommentsService
}

final class DefaultServiceFactory: ServiceFactory {
    var services: Services {
        Services(usersService: usersService,
                 postsService: postsService,
                 commentsService: commentsService)
    }
    let repositoryFactory: RepositoryFactory

    private let usersService: UsersService
    private let postsService: PostsService
    private let commentsService: CommentsService

    init() {
        self.repositoryFactory = DefaultRepositoryFactory()

        self.usersService = DefaultUsersService(usersRepository: repositoryFactory.usersRepository)
        self.postsService = DefaultPostsService(userService: usersService, postsRepository: repositoryFactory.postsRepository)
        self.commentsService = DefaultCommentsService(commentsRepository: repositoryFactory.commentsRepository)
    }
}
