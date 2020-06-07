//
//  DefaultcommentsRepository.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

final class DefaultCommentsRepository: CommentsRepository {
    func fetchComments(withParams params: [String: String]?) -> Observable<ApiResult<[Comment], ApiError>> {
        return SessionManager.default.rx
            .request(.get,
                     UrlBuilder().set(path: ApiResources.posts.path).set(parameters: params).build() ?? "",
                     parameters: nil,
                     encoding: URLEncoding.default,
                     headers: nil)
            .responseData()
            .expectingObject(ofType: [Comment].self)
    }
}
