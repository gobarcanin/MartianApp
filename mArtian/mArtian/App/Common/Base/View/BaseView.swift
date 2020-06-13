//
//  BaseView.swift
//  mArtian
//
//  Created by Goran Obarcanin on 12/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

class BaseView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    convenience init() {
        self.init(frame: .zero)
    }

    func addSubviews() { preconditionFailure("Override in subclass \(#function)") }

    func makeConstraints() { preconditionFailure("Override in subclass \(#function)") }
    
}

extension BaseView {
    func setupView() {
        addSubviews()
        makeConstraints()
    }


}
