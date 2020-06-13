//
//  DefaultUserService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

final class DefaultUsersService: UsersService {
    private let usersRepository: UsersRepository

    let availableUsers: Observable<[User]>
    init(usersRepository: UsersRepository) {
        self.usersRepository = usersRepository

        availableUsers = usersRepository
            .fetchUsers(withUserParams: nil)
            .map { result in
                switch result {
                case .success(let response):
                    return response
                case .failure(_):
                    throw ApiError.someError("[DefaultUsersService]")
                }
            }
            .share(replay: 1)
            .debug()
    }
}
