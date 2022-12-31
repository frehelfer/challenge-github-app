//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

class DetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DetailView {
    
    func setupViews() {

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {

        
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            
            
        ])
    }
}
