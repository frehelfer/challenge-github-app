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
    
    private var repository: Repository?
    private var ownerImage: UIImage?
    
    lazy var repositoryInfoView: RepositoryInfoView = {
        let view = RepositoryInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ownerView: OwnerView = {
        let view = OwnerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailView {
    
    func setupViews() {
        backgroundColor = .systemBackground
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(repositoryInfoView)
        addSubview(ownerView)
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
        
            repositoryInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            repositoryInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            repositoryInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            ownerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ownerView.topAnchor.constraint(equalTo: repositoryInfoView.bottomAnchor),
            ownerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

extension DetailView {
    
    public func setupView(repository: Repository) {
        self.repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(repoTitle: repository.name ?? "", repoDescription: repository.description ?? "", stars: repository.stargazersCount ?? 0, forks: repository.forksCount ?? 0))
        
        self.ownerView.updateView(with: OwnerViewConfiguration(ownerTitle: "Owner", ownerName: repository.owner?.login ?? "", ownerBio: repository.owner?.type ?? "", ownerImage: ownerImage ?? UIImage()))
    }
    
    public func setupViewImage(ownerImage: UIImage) {
        self.ownerImage = ownerImage
    }
}
