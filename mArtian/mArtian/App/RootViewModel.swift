//
//  RootViewModel.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

/*
 Application root state
 */
protocol RootState { }

enum AppRootState: RootState {
    case sessionActive(ViewModelFactory)
}

/*
 RootVM
 */
struct RootViewModelInput { }

struct RootViewModelOutput {
    let rootState: Observable<RootState>

    init(rootState: Observable<RootState>) {
        self.rootState = rootState
    }
}

protocol RootViewModel {
    func transform(input: RootViewModelInput) -> RootViewModelOutput
}

private struct DefaultRootViewModel: RootViewModel {
    private let martianApi: MartianApi

    init() {
        martianApi = MartianApi()
    }

    func transform(input: RootViewModelInput) -> RootViewModelOutput {
        return RootViewModelOutput(rootState:
            martianApi
            .authState
            .flatMapLatest { (authState: AuthState) -> Observable<RootState> in
                switch authState {
                case .session(let services):
                    return .just(AppRootState.sessionActive(makeViewModelFactroy(services: services)))
                }
        }
        )
    }
}

func makeRootViewModel() -> RootViewModel {
    return DefaultRootViewModel()
}
