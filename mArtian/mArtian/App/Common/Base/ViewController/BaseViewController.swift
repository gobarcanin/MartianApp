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

    /*
     * Override to bind viewModel
     */
    func bindViewModel() { preconditionFailure("Override in subclass \(#function)") }

    /*
    * Override to add subviews
    */
    func addSubviews() { preconditionFailure("Override in subclass \(#function)") }

    /*
    * Override to make constraints
    */
    func makeConstraints() { preconditionFailure("Override in subclass \(#function)") }

    /*
    * Override to make view stylish
    */
    func styleView() { }
}
