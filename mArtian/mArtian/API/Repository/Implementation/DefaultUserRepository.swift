//
//  DefaultUserRepository.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class DefaultUsersRepository: UsersRepository {
    func fetchUsers(withUserParams params: [String: String]?) -> Observable<ApiResult<[User], ApiError>> {
        return SessionManager.default.rx
            .request(.get,
                     ApiResources.users.path(parameters: params) ?? "",
                     parameters: nil,
                     encoding: URLEncoding.default,
                     headers: nil)
            .responseData()
            .expectingObject(ofType: [User].self)
    }
}
