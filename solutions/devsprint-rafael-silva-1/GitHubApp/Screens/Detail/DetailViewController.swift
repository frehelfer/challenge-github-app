//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var repository: Repository?
    private var ownerImage: UIImage?
    
    private let detailView = DetailView()
    
    private let service = Service()

    override func loadView() {
        self.view = detailView
    }
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        detailView.configureTableViewDelegate(delegate: self, dataSource: self)
    }
    
    // MARK: - Private func
    
    private func downloadImage(repository: Repository) {
        
        service.fetchUserImage(urlString: repository.owner?.avatarUrl ?? "") { [weak self] image, error in
            DispatchQueue.main.async {
                guard let image else { return }
                self?.ownerImage = image
                self?.detailView.reloadView()
            }
        }
    }
    
}

// MARK: - Public func

extension DetailViewController {
    
    public func updateView(with repository: Repository) {
        self.repository = repository
        self.downloadImage(repository: repository)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryInfoCell.cellIdentifier, for: indexPath) as! RepositoryInfoCell
            cell.updateView(with: RepositoryInfoViewConfiguration(repoTitle: repository?.name ?? "", repoDescription: repository?.description ?? "", stars: repository?.stargazersCount ?? 0, forks: repository?.forksCount ?? 0))
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: OwnerCell.cellIdentifier, for: indexPath) as! OwnerCell
            cell.updateView(with: OwnerViewConfiguration(ownerTitle: "Owner", ownerName: repository?.owner?.login ?? "", ownerBio: repository?.owner?.type ?? ""), repository: self.repository)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TwoLabelsAndButtonCell.cellIdentifier, for: indexPath) as! TwoLabelsAndButtonCell
            cell.updateView(with: TwoLabelsAndButtonConfiguration(firstText: "Languages", secondText: "Main language: \(self.repository?.language ?? "")", buttonText: "See languages"), repository: self.repository)
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 165.5
        } else if indexPath.row == 1 {
            return 204
        } else {
            return 178
        }
    }
    
    
    
    
    
}
