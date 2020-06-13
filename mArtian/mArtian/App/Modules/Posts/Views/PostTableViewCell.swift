//
//  PostTableViewCell.swift
//  mArtian
//
//  Created by Goran Obarcanin on 12/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    static let identifier: String = "PostTableViewCell"

    lazy var postView: PostView = {
        let postView = PostView()
        return postView
    }()

    var model: PostsDataModel? {
        didSet {
            postView.postLabel.text = model?.post
            postView.userLabel.text = model?.username
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

extension PostTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        addSubview(postView)
    }

    func makeConstraints() {
        postView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(0)
        }
    }
}
