//
//  Address.swift
//  mArtian
//
//  Created by Goran Obarcanin on 06/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

struct Address: ApiParameter {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
