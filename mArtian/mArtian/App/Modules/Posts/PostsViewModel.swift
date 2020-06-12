//
//  PostsViewModel.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift

struct PostsViewModelInput {

}

struct PostsViewModelOutput {

}

protocol PostsViewModel {
    func transform(input: PostsViewModelInput) -> PostsViewModelOutput
}

final class DefaultPostsViewModel: PostsViewModel {
    let postsService: PostsService
    let navigator: Navigator
    var disposeBag: DisposeBag!
    init(postsService: PostsService, navigator: Navigator) {
        self.postsService = postsService
        self.navigator = navigator
    }

    func transform(input: PostsViewModelInput) -> PostsViewModelOutput {
        disposeBag = DisposeBag()
        self.postsService
            .currentPosts
            .subscribe(onNext: { _ in })
            .disposed(by: disposeBag)
        return PostsViewModelOutput()
    }
}
