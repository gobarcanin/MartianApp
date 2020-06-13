//
//  PostView.swift
//  mArtian
//
//  Created by Goran Obarcanin on 12/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit
import SnapKit

final class PostView: BaseView {

    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    lazy var headerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    lazy var postView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func addSubviews() {
        addSubview(contentStackView)
        headerView.addSubview(userImageView)
        headerView.addSubview(userLabel)
        contentStackView.addArrangedSubview(headerView)
        postView.addSubview(postLabel)
        contentStackView.addArrangedSubview(postView)
    }

    override func makeConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.bottom.top.trailing.leading.equalTo(0)
        }
        userImageView.snp.makeConstraints { make in
            make.leading.top.equalTo(5)
            make.bottom.equalTo(5)
            make.width.height.equalTo(50)
        }
        userLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView.snp.centerY)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }
        postLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(5)
            make.bottom.trailing.equalTo(-5)
        }
    }
}

