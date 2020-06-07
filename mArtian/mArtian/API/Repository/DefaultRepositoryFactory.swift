//
//  DefaultRepositoryFactory.swift
//  mArtian
//
//  Created by Goran Obarcanin on 06/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

protocol RepositoryFactory {
    var userRepository: UserRepository { get }
}

struct DefaultRepositoryFactory: RepositoryFactory {
    let userRepository: UserRepository

    init() {
        self.userRepository = DefaultUserRepository()
    }
}
