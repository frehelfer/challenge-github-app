//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var repository: Repository?
    
    private let detailView = DetailView()
    
    private let service = Service()

    override func loadView() {
        self.view = detailView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        service.fetchUserImage(urlString: repository?.owner?.avatarUrl ?? "") { [weak self] image, error in
            DispatchQueue.main.async {
                if let image {
                    self?.detailView.setupViewImage(ownerImage: image)
                } else {
                    
                }
            }
        }
        
    }
    
}

extension DetailViewController {
    
    public func updateView(with repository: Repository) {
        detailView.setupView(repository: repository)
    }
    
}
