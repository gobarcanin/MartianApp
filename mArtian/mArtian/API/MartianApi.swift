//
//  MartianApi.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum AuthState {
    case session(Services)
}

final class MartianApi {
    let authState: Observable<AuthState>
    let apiAdapter: RequestAdapter = ApiAdapter()
    init() {

        SessionManager.default.adapter = apiAdapter

        let mainFactory = DefaultServiceFactory()
        authState = .just(.session(mainFactory.services))
    }
}
