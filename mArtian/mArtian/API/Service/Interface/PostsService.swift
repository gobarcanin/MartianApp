//
//  PostsService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

protocol PostsService {
    var currentPosts: Observable<[MappedPost]> { get }
}
