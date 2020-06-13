//
//  AppRootViewController.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import RxCocoa

class AppRootViewController: RootViewController {
    override func bindViewModel() {
        viewModel
            .transform(input: RootViewModelInput())
            .rootState
            .asDriver(onErrorRecover: { _ in Driver.empty() })
            .drive(onNext: { (rootState: RootState) in
                guard let rootState = rootState as? AppRootState else { fatalError("Invalid root state") }
                switch rootState {
                case .sessionActive(let viewModelFactory):
                    makeNavigator(rootViewController: self,
                                  viewModelFactory: viewModelFactory)
                        .navigate(to: .posts, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
}

private func makeNavigator(rootViewController: RootViewController, viewModelFactory: ViewModelFactory) -> Navigator {
    return DefaultNavigator(rootViewController: rootViewController,
                            viewControllerFactory: DefaultViewControllerFactory(viewModelFactory: viewModelFactory)
    )
}
