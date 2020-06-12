//
//  PostsViewController.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

final class PostsViewController: BaseViewController {

    let postsViewModel: PostsViewModel

    init(viewModel: PostsViewModel) {
        self.postsViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .cyan
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func bindViewModel() {
        _ = postsViewModel.transform(input: PostsViewModelInput())
    }
    
}
