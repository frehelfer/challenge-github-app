//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    
    private var repositories: [Repository] = []
     
    private let emptyView = EmptyView()
    private let loadingView = LoadingView()
    private let listView = ListView()
    
    private let service = Service()

    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Type a GitHub user name"
        controller.searchResultsUpdater = self
        controller.delegate = self
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()
    
    private lazy var settingsButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        button.style = .plain
        button.target = self
        button.action = #selector(tappedSettingsButton)
        return button
    }()

    @objc func tappedSettingsButton() {
        let vc = SettingsViewController()
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = emptyView
    }

    override func viewDidLoad() {
        
        listView.configureTableViewDelegate(delegate: self)

        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationItem.searchController = searchController
        self.navigationItem.rightBarButtonItem = settingsButton
    }
}

extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard
            searchController.searchBar.text != "",
            let text = searchController.searchBar.text else { return }

        self.view = loadingView

        service.fetchUserRepositories(userName: text) { [weak self] repositories, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let repositories {
                    self?.repositories = repositories
                    self?.listView.updateView(with: repositories)
                    self?.view = self?.listView
                } else {
                    self?.view = self?.emptyView
                }
            }
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.updateView(with: repositories[indexPath.row])
        present(vc, animated: true)
    }
    
}
