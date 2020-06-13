//
//  PostsViewController.swift
//  mArtian
//
//  Created by Goran Obarcanin on 11/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift

final class PostsViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()

    private typealias DataSource = RxTableViewSectionedReloadDataSource<SectionOfPostsModel>
    private var disposeBag: DisposeBag!
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
        disposeBag = DisposeBag()
        let output = postsViewModel.transform(input: PostsViewModelInput())
        let datasource = DataSource(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { fatalError("Missing cell type") }
                cell.model = item
                return cell
            })

        _ = output
            .posts
            .bind(to: tableView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)

    }

    override func addSubviews() {
        view.addSubview(tableView)
    }

    override func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.bottom.trailing.leading.top.equalTo(0)
        }
    }
}
