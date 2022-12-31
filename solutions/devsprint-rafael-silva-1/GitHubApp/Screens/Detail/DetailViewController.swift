//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var repository: Repository?

    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        detailView.repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(repoTitle: repository?.name ?? "", repoDescription: repository?.description ?? "", stars: repository?.stargazersCount ?? 0, forks: repository?.forksCount ?? 0))
        detailView.ownerView.updateView(with: OwnerViewConfiguration(ownerTitle: "Owner", ownerName: repository?.owner?.login ?? "", ownerBio: repository?.owner?.type ?? "", ownerImage: UIImage(systemName: "person.fill")))
    }
}

extension DetailViewController {
    
    public func updateView(with repository: Repository) {
        self.repository = repository
    }
    
}
