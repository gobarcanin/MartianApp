//
//  ApiAdapter.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation
import Alamofire

struct ApiAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.addValue("bWFydGlhbmFuZG1hY2hpbmU=", forHTTPHeaderField: "X-Auth")
        return urlRequest
    }
}
