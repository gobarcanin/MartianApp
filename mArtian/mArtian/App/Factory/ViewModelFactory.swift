//
//  ViewModelFactory.swift
//  mArtian
//
//  Created by Goran Obarcanin on 09/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

/*
 Default View Model Factory
 */
func makeViewModelFactroy(services: Services) -> ViewModelFactory {
    return DefaultViewModelFactory(services: services)
}

protocol ViewModelFactory {
    var services: Services { get }
    func postsViewModel(navigator: Navigator) -> PostsViewModel
    func usersViewModel(navigator: Navigator) -> UsersViewModel
}

final class DefaultViewModelFactory: ViewModelFactory {
    var services: Services
    init(services: Services) {
        self.services = services
    }

    func postsViewModel(navigator: Navigator) -> PostsViewModel {
        return DefaultPostsViewModel(postsService: services.postsService,
                                     navigator: navigator)
    }

    func usersViewModel(navigator: Navigator) -> UsersViewModel {
        return DefaultUsersViewModel(usersService: services.usersService, navigator: navigator)
    }

}
