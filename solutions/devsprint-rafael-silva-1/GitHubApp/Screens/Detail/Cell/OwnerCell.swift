//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 28/12/22.
//

import UIKit

struct OwnerViewConfiguration {
    let ownerTitle: String
    let ownerName: String
    let ownerBio: String
    let ownerImage: UIImage
}

class OwnerCell: UITableViewCell {
    
    private lazy var ownerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var ownerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    private lazy var ownerBio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var ownerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 48/2
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var button: UIView = {
        let button = ButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.updateView(with: ButtonViewConfiguration(buttonTitle: "See Profile"))
        return button
    }()

    // MARK: - Init
    
    static let cellIdentifier = "OwnerCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension OwnerCell {
    
    func setupViews() {
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        contentView.addSubview(ownerTitle)
        contentView.addSubview(ownerName)
        contentView.addSubview(ownerBio)
        contentView.addSubview(button)
        contentView.addSubview(ownerImage)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        
            ownerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            ownerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            ownerTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            
            ownerName.leadingAnchor.constraint(equalTo: ownerTitle.leadingAnchor),
            ownerName.trailingAnchor.constraint(equalTo: ownerTitle.trailingAnchor),
            ownerName.topAnchor.constraint(equalTo: ownerTitle.bottomAnchor, constant: 9),
            
            ownerBio.leadingAnchor.constraint(equalTo: ownerTitle.leadingAnchor),
            ownerBio.trailingAnchor.constraint(equalTo: ownerTitle.trailingAnchor),
            ownerBio.topAnchor.constraint(equalTo: ownerName.bottomAnchor, constant: 9),
            
            button.leadingAnchor.constraint(equalTo: ownerTitle.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: ownerTitle.trailingAnchor),
            button.topAnchor.constraint(equalTo: ownerBio.bottomAnchor, constant: 21),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 23.5),
            
            ownerImage.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -22),
            ownerImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            ownerImage.heightAnchor.constraint(equalToConstant: 48),
            ownerImage.widthAnchor.constraint(equalToConstant: 48),
            
        ])
    }
}

extension OwnerCell {
    
    public func updateView(with configuration: OwnerViewConfiguration) {
        self.ownerTitle.text = configuration.ownerTitle
        self.ownerName.text = configuration.ownerName
        self.ownerBio.text = configuration.ownerBio
    }
    
    public func updateImage(image: UIImage) {
        self.ownerImage.image = image
    }
    
}
