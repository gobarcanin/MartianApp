//
//  UrlBuilder.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//
import Foundation

enum UrlBuilderComponent {
    case scheme(String?)
    case host(String?)
    case path(String?)
    case parameters([String: String]?)
}

final class UrlBuilder {
    private var components: URLComponents

    init() {
        self.components = URLComponents()
    }

    func set(component: UrlBuilderComponent) -> UrlBuilder {
        switch component {
        case .scheme(let scheme):
            guard let scheme = scheme else { return self }
            self.components.scheme = scheme
            return self
        case .host(let host):
            guard let host = host else { return self }
            self.components.host = host
            return self
        case .path(let path):
            guard let path = path else { return self }
            self.components.path = path
            return self
        case .parameters(let parameters):
            guard let parameters = parameters else { return self }
            self.components.queryItems = parameters.queryItems
            return self
        }
    }

    func build() -> URL? {
        do {
            let url = try self.components.asURL()
            return url
        } catch {
            return nil
        }
    }
}
