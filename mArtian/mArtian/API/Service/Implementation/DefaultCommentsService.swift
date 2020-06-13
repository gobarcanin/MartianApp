//
//  DefaultCommentsService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

final class DefaultCommentsService: CommentsService {
    private let commentsRepository: CommentsRepository

    init(commentsRepository: CommentsRepository) {
        self.commentsRepository = commentsRepository
    }

    //resolve this with reflection
    func comments<T:Post>(for post: T) -> Observable<[Comment]> {
        commentsRepository.getComments(withParams: ["postId": String(post.id)])
            .map { result in
                switch result {
                case .success(let response): return response
                case .failure(_): throw ApiError.someError("[CommentsService] something went wrong")
                }
        }
    }

}
