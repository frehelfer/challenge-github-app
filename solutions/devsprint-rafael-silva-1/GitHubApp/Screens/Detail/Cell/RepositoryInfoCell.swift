//
//  RepositoryInfoView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 26/12/22.
//

import UIKit

struct RepositoryInfoViewConfiguration {
    let repoTitle: String
    let repoDescription: String
    let stars: Int
    let forks: Int
}

class RepositoryInfoCell: UITableViewCell {
    
    private lazy var repoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var repoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var starsAndForks: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: - Init

    static let cellIdentifier = "RepositoryInfoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension RepositoryInfoCell {
    
    func setupViews() {
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        contentView.addSubview(repoTitle)
        contentView.addSubview(repoDescription)
        contentView.addSubview(starsAndForks)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        
            repoTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repoTitle.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            repoTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            
            repoDescription.leadingAnchor.constraint(equalTo: repoTitle.leadingAnchor),
            repoDescription.trailingAnchor.constraint(equalTo: repoTitle.trailingAnchor),
            repoDescription.topAnchor.constraint(equalTo: repoTitle.bottomAnchor, constant: 9),
            
            starsAndForks.leadingAnchor.constraint(equalTo: repoTitle.leadingAnchor),
            starsAndForks.trailingAnchor.constraint(equalTo: repoTitle.trailingAnchor),
            starsAndForks.topAnchor.constraint(equalTo: repoDescription.bottomAnchor, constant: 13),
            starsAndForks.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18.5)
        ])
    }
}

extension RepositoryInfoCell {
    
    public func updateView(with configuration: RepositoryInfoViewConfiguration) {
        self.repoTitle.text = configuration.repoTitle
        self.repoDescription.text = configuration.repoDescription
        self.starsAndForks.text = "\(configuration.stars) estrelas  \(configuration.forks) bifurcações"
    }
    
}
