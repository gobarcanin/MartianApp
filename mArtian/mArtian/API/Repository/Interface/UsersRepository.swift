//
//  UserRepository.swift
//  mArtian
//
//  Created by Goran Obarcanin on 06/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

protocol UsersRepository {
    func fetchUsers(withUserParams params: [String: String]?) -> Observable<ApiResult<[User], ApiError>>
}

