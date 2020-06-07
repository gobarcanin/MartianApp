//
//  ApiResult.swift
//  mArtian
//
//  Created by Goran Obarcanin on 06/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import RxSwift

enum ApiError: Error {
    case someError(String)
}

enum ApiResult<Value, Error> {
    case success(Value)
    case failure(Error)

    init(value: Value) {
        self = .success(value)
    }

    init(error: Error) {
        self = .failure(error)
    }
}

extension Observable where Element == (HTTPURLResponse, Data) {
    func expectingObject<T: Codable>(ofType type: T.Type) -> Observable<ApiResult<T, ApiError>> {
        return self.map { (httpUrlResponse, data) -> ApiResult<T, ApiError> in
            switch httpUrlResponse.statusCode {
            case 200...299:
                let object = try JSONDecoder().decode(type, from: data)
                return .success(object)
            default:
                return .failure(.someError("Error has occured"))
            }
        }
    }
}
