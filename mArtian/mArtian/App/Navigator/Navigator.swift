//
//  Navigator.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

protocol BaseNavigator {
    func navigateOnCurrentNavigationStack(viewController: UIViewController, animated: Bool)
    func navigateByReplacingNavigationStack(viewConrollers: [UIViewController], animated: Bool)
    func popViewController(animated: Bool)
    func presentOverlay(viewController: UIViewController, animated: Bool)
    func dismissOverlay(animated: Bool)

    var navigationStack: [UIViewController] { get }
    var rootController: UIViewController { get }
    var presentedViewController: UIViewController? { get }
}

protocol Navigator: BaseNavigator {
    var viewControllerFactory: ViewControllerFactory { get }
}

extension Navigator {
    func navigate(to screen: AppScreen, animated: Bool) {
        let viewController = viewControllerFactory.viewController(screen: screen, navigator: self)
        switch screen {
        case .posts, .users:
            self.navigateOnCurrentNavigationStack(viewController: viewController, animated: animated)
        }
    }
}
