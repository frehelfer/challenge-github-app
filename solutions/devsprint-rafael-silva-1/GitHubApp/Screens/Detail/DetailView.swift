//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

struct DetailViewConfiguration {
    let repository: Repository
}

class DetailView: UIView {
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.allowsSelection = false
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(TwoLabelsAndButtonCell.self, forCellReuseIdentifier: TwoLabelsAndButtonCell.cellIdentifier)
        tb.register(RepositoryInfoCell.self, forCellReuseIdentifier: RepositoryInfoCell.cellIdentifier)
        tb.register(OwnerCell.self, forCellReuseIdentifier: OwnerCell.cellIdentifier)
        return tb
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DetailView {
    
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
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - Public func

extension DetailView {
    
    public func configureTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func reloadView() {
        tableView.reloadData()
    }
}
