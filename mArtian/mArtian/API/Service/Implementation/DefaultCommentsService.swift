//
//  DefaultCommentsService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

final class DefaultCommentsService: CommentsService {
    private let commentsRepository: CommentsRepository
    
    init(commentsRepository: CommentsRepository) {
        self.commentsRepository = commentsRepository
    }
}
