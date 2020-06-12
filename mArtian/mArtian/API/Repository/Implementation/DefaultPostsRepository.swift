//
//  DefaultPostsRepository.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

final class DefaultPostsRepository: PostsRepository {
    func getPosts<T>(withParams params: [String: String]?, ofType type: T.Type) -> Observable<ApiResult<[T], ApiError>> where T: Post {
        return SessionManager.default.rx
            .request(.get,
                     ApiResources.posts.path(parameters: params)!,
                     parameters: nil,
                     encoding: URLEncoding.default,
                     headers: nil)
            .debug()
            .responseData()
            .expectingObject(ofType: [T].self)
    }
}
