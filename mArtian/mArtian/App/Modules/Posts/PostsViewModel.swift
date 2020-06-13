//
//  PostsViewModel.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import RxSwift
import RxDataSources

struct PostsDataModel: Equatable {
    let name: String?
    let username: String?
    let post: String?
}

struct SectionOfPostsModel {
    var items: [Item]
}

extension SectionOfPostsModel: SectionModelType {
    typealias Item = PostsDataModel

    init(original: Self, items: [Self.Item]) {
        self = original
        self.items = items
    }
}

struct PostsViewModelInput {

}

struct PostsViewModelOutput {
    let posts: Observable<[SectionOfPostsModel]>
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
        let postsModel = self.postsService
            .currentPosts
            .map { $0.map { PostsDataModel(name: $0.user?.name, username: $0.user?.username, post: $0.body) } }
            .map { [SectionOfPostsModel.init(items: $0)] }

        return PostsViewModelOutput(posts: postsModel)
    }
}
