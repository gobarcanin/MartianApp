//
//  RootViewController.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

open class RootViewController: UIViewController {
    let disposeBag = DisposeBag()
    let viewModel: RootViewModel

    fileprivate var mainNavigationController: UINavigationController?
    fileprivate var child: UIViewController? = nil {
        didSet {
            if let oldVC = oldValue {
                if oldVC.presentedViewController != nil {
                    oldVC.dismiss(animated: false, completion: nil)
                }
                oldVC.willMove(toParent: nil)
                oldVC.view.removeFromSuperview()
                oldVC.removeFromParent()
            }
            if let newVC = child {
                addChild(newVC)
                view.addSubview(newVC.view)
                newVC.view.frame = view.bounds
                newVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                newVC.didMove(toParent: self)
            }
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func bindViewModel() {

    }

}

// MARK: View controller lifecycle
extension RootViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

// MARK: Navigation on stack
extension RootViewController {
    var navigationStack: [UIViewController] {
        createMainNavigationControllerIfNeeded()
        return mainNavigationController!.viewControllers
    }

    func navigateOnCurrentNavigationStack(viewController: UIViewController, animated: Bool) {
        createMainNavigationControllerIfNeeded()
        DispatchQueue.mainSafeAsync {
            self.mainNavigationController!.pushViewController(viewController, animated: animated)
        }
        setNeedsStatusBarAppearanceUpdate()
    }

    func navigateByReplacingNavigationStack(viewControllers: [UIViewController], animated: Bool) {
        createMainNavigationControllerIfNeeded()
        DispatchQueue.mainSafeAsync {
            self.mainNavigationController!.setViewControllers(viewControllers, animated: animated)
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    func popViewController(animated: Bool) {
        DispatchQueue.mainSafeAsync {
            self.mainNavigationController!.popViewController(animated: animated)
        }
        setNeedsStatusBarAppearanceUpdate()
    }
}

// MARK: Helper methods
extension RootViewController {
    func add(child: UIViewController) {
        removeChildren()

        addChild(child)
        child.view.frame = view.bounds
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func removeChildren() {
        children.forEach { child in
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }

    func createMainNavigationControllerIfNeeded() {
        if mainNavigationController == nil {
            let navigationController = UINavigationController()
            mainNavigationController = navigationController
            add(child: navigationController)
        }
    }
}
