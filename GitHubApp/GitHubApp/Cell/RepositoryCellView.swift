//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 12/12/22.
//

import UIKit

class RepositoryCellView: UITableViewCell {
    
    static let identifier = "RepositoryCellView"
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 2
        return view
    }()
    
    lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "teste"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var repositoryUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "teste"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    lazy var chevron: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "chevron.forward")
        image.tintColor = .gray
        return image
    }()
    
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: addElements
    
    private func addElements() {
        addSubview(chevron)
        addSubview(stackView)
        stackView.addArrangedSubview(repositoryName)
        stackView.addArrangedSubview(repositoryUserName)
        
        NSLayoutConstraint.activate([
            
            chevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            chevron.heightAnchor.constraint(equalToConstant: 17),
            chevron.widthAnchor.constraint(equalToConstant: 12),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
        ])
    }
    
    
    // MARK: Public func
    
//    public func updateView(with configuration: RepositoryCellViewConfiguration) {
//        repositoryName.text = configuration.repositoryName
//        repositoryUserName.text = configuration.repositoryUserName
//    }

}
