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
}

final class DefaultViewModelFactory: ViewModelFactory {
    var services: Services
    init(services: Services) {
        self.services = services
    }

}
