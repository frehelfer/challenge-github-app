//
//  StartView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 25/01/23.
//

import UIKit

class StartView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 14
        return stack
    }()
    
    private lazy var startLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Start searching above 🤩"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private lazy var searchForUsersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search for users to see their public repositories here!"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .secondaryLabel
        return label
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

private extension StartView {
    
    func setupViews() {
        backgroundColor = .systemBackground
        
        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(startLabel)
        stackView.addArrangedSubview(searchForUsersLabel)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
