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
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 14
        return stack
    }()
    
    private lazy var repositoryInfoView: RepositoryInfoView = {
        let view = RepositoryInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ownerView: OwnerView = {
        let view = OwnerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(repositoryInfoView)
//        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(ownerView)
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - Public func

extension DetailView {
    
    public func setupView(repository: Repository) {
        self.repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(repoTitle: repository.name ?? "", repoDescription: repository.description ?? "", stars: repository.stargazersCount ?? 0, forks: repository.forksCount ?? 0))
        
        self.ownerView.updateView(with: OwnerViewConfiguration(ownerTitle: "Owner", ownerName: repository.owner?.login ?? "", ownerBio: repository.owner?.type ?? "", ownerImage: ownerImage ?? UIImage()))
    }
    
    public func setupViewImage(ownerImage: UIImage) {
        self.ownerView.updateImage(image: ownerImage)
    }
}
