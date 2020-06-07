//
//  DefaultPostsService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

final class DefaultPostsService: PostsService {
    private let postsRepository: PostsRepository
    private let userService: UsersService

    init(userService: UsersService,
         postsRepository: PostsRepository) {
        self.userService = userService
        self.postsRepository = postsRepository
    }
}
