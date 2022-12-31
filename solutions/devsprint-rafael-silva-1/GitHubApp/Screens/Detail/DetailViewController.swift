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
        self.view = DetailView()
    }
}

extension DetailViewController {
    
    public func updateView(with repository: Repository) {
        self.repository = repository
    }
    
}
