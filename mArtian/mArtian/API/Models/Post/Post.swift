//
//  Post.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

struct Post: ApiParameter {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
