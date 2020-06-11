//
//  ViewControllerFactory.swift
//  mArtian
//
//  Created by Goran Obarcanin on 09/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

protocol Screen { }

enum AppScreen: Screen {
    case posts
    case users
}

protocol ViewControllerFactory {
    func viewController(screen: Screen, navigator: Navigator) -> UIViewController
}

final class DefaultViewControllerFactory: ViewControllerFactory {
    private let viewModelFactory: ViewModelFactory

    init(viewModelFactory: ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }

    func viewController(screen: Screen, navigator: Navigator) -> UIViewController {
        guard let screen = screen as? AppScreen else { fatalError("Screen not found") }
        switch screen {
        case .posts:
            Post
        case .users:
            
        }
    }

}
