//
//  UserService.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

protocol UsersService {
    var availableUsers: Observable<[User]> { get }
}
