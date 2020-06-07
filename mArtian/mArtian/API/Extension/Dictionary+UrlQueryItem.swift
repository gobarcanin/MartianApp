//
//  Dictionary+UrlQueryItem.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

public extension Dictionary where Key == String, Value == String {
    var queryItems: [URLQueryItem]? {
        guard self.keys.count > 0 else { return nil }
        var items: [URLQueryItem] = []
        for (key, value) in self {
            items.append(URLQueryItem(name: key, value: value))
        }
        return items
    }
}
