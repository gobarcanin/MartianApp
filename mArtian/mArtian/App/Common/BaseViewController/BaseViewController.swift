//
//  BaseViewController.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        bindViewModel()
        styleView()
    }

    func bindViewModel() { }

    func addSubviews() { }

    func makeConstraints() { }

    func styleView() { }
}
