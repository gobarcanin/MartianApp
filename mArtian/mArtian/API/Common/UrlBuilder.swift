//
//  UrlBuilder.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//
import Foundation

final class UrlBuilder {
    private var components: URLComponents

    init() {
        self.components = URLComponents()
    }

    func set(path: String) -> UrlBuilder {
        self.components.path = path
        return self
    }

    func set(parameters: [String: String]?) -> UrlBuilder {
        if let parameters = parameters {
            self.components.queryItems = parameters.queryItems
        }
        return self
    }

    func build() -> URL? {
        return self.components.url
    }
}
