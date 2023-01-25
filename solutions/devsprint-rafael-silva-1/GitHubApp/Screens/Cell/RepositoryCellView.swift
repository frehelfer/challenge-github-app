//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 12/12/22.
//

import UIKit

class RepositoryCellView: UITableViewCell {
    
    static let identifier = "RepositoryCellView"
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 2
        return view
    }()
    
    private lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private lazy var repositoryUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var chevron: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.forward")
        image.tintColor = .secondaryLabel
        return image
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: addElements
    
    private func setupViews() {
        contentView.backgroundColor = .systemBackground
        addSubview(chevron)
        addSubview(stackView)
        stackView.addArrangedSubview(repositoryName)
        stackView.addArrangedSubview(repositoryUserName)
        
        NSLayoutConstraint.activate([
            
            chevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.83),
            chevron.heightAnchor.constraint(equalToConstant: 16),
            chevron.widthAnchor.constraint(equalToConstant: 10),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16.5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.5),
            
        ])
    }
}

// MARK: - Public func

extension RepositoryCellView {
   
    public func updateView(with configuration: Repository) {
        repositoryName.text = configuration.name
        repositoryUserName.text = configuration.owner?.login
    }
    
}
