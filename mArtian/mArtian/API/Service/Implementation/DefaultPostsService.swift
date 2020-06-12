//
//  DefaultPostsService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

final class DefaultPostsService: PostsService {
    private let postsRepository: PostsRepository
    private let userService: UsersService

    private let availablePosts: Observable<[DefaultPost]>
    let currentPosts: Observable<[MappedPost]>
    init(userService: UsersService,
         postsRepository: PostsRepository) {
        self.userService = userService
        self.postsRepository = postsRepository

        availablePosts = postsRepository.getPosts(withParams: nil, ofType: DefaultPost.self)
            .map { response in
                switch response {
                case .success(let result):
                    return result
                case .failure(_): throw ApiError.someError("[DefaultPostsService] Error fetching posts")
                }
            }
            .share(replay: 1)

        currentPosts = Observable.combineLatest(
            availablePosts,
            userService.availableUsers
        ).map { posts, users in
            posts.map { post in
                MappedPost(with: post, user: users.filter { $0.id == post.userId }.first)
            }
        }.debug()
    }

}
