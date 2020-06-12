//
//  UsersViewModel.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

struct UsersViewModelInput {

}

struct UsersViewModelOutput {

}

protocol UsersViewModel {
    func transform(usersViewModel: UsersViewModelInput) -> UsersViewModelOutput
}

final class DefaultUsersViewModel: UsersViewModel {
    let usersService: UsersService
    let navigator: Navigator
    init(usersService: UsersService, navigator: Navigator) {
        self.usersService = usersService
        self.navigator = navigator
    }

    func transform(usersViewModel: UsersViewModelInput) -> UsersViewModelOutput {
        return UsersViewModelOutput()
    }
}
