//
//  DispatchQueue+SafeAsync.swift
//  mArtian
//
//  Created by Goran Obarcanin on 07/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func mainSafeAsync(block: @escaping () -> Void) {
        guard Thread.isMainThread else { DispatchQueue.main.async(execute: block); return }
        block()
    }
}

