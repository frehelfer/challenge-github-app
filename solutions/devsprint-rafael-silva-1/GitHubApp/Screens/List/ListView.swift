//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

struct ListViewConfiguration {

    let listItems: [Repository]
}

final class ListView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [Repository] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.identifier)
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListView {

    func setupViews() {
        backgroundColor = .systemBackground
        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(tableView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Public func

extension ListView {

    public func updateView(with repositories: [Repository]) {
        listItems = repositories
        tableView.reloadData()
    }
    
    public func configureTableViewDelegate(delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
}

// MARK: - TableView Config

extension ListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.identifier, for: indexPath) as? RepositoryCellView else {
            fatalError("Unsupported")
        }
        cell.updateView(with: listItems[indexPath.row])
        return cell
    }
}
