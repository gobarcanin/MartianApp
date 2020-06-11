//
//  DefaultNavigator.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

struct DefaultNavigator: Navigator {
    let rootViewController: RootViewController
    let viewControllerFactory: ViewControllerFactory

    init(rootViewController: RootViewController, viewControllerFactory: ViewControllerFactory) {
        self.rootViewController = rootViewController
        self.viewControllerFactory = viewControllerFactory
    }

    var navigationStack: [UIViewController] {
        rootViewController.navigationStack
    }

    var rootController: UIViewController {
        return rootViewController
    }

    var presentedViewController: UIViewController? {
        return rootViewController.navigationStack.last
    }

    func navigateOnCurrentNavigationStack(viewController: UIViewController, animated: Bool) {
        DispatchQueue.mainSafeAsync {
            self.rootViewController.navigateOnCurrentNavigationStack(viewController: viewController, animated: animated)
        }
    }

    func navigateByReplacingNavigationStack(viewConrollers: [UIViewController], animated: Bool) {
        DispatchQueue.mainSafeAsync {
            self.rootViewController.navigateByReplacingNavigationStack(viewControllers: viewConrollers, animated: animated)
        }
    }

    func popViewController(animated: Bool) {
        DispatchQueue.mainSafeAsync {
            self.rootViewController.popViewController(animated: animated)
        }
    }

    func presentOverlay(viewController: UIViewController, animated: Bool) {
        DispatchQueue.mainSafeAsync {
            guard self.rootViewController.presentedViewController != viewController else { return }
            self.rootViewController.present(viewController, animated: animated, completion: nil)
        }
    }

    func dismissOverlay(animated: Bool) {
        DispatchQueue.mainSafeAsync {
            guard self.rootViewController.presentedViewController != nil else { return }
            self.rootViewController.dismiss(animated: animated, completion: nil)
        }
    }
}
