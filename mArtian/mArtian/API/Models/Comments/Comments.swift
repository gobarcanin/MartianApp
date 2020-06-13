//
//  Comments.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

struct Comment: ApiParameter {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
