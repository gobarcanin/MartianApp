//
//  PostsRepository.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

protocol PostsRepository {
    func getPosts<T: Post>(withParams params: [String: String]?, ofType type: T.Type) -> Observable<ApiResult<[T], ApiError>>
}
