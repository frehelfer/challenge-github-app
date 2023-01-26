//
//  TwoLabelsAndButton.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 25/01/23.
//

import UIKit

struct TwoLabelsAndButtonConfiguration {
    let firstText: String
    let secondText: String
    let buttonText: String
}

class TwoLabelsAndButtonCell: UITableViewCell {

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    private lazy var button: ButtonView = {
        let button = ButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Init
    
    static let cellIdentifier = "TwoLabelsAndButtonCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}

private extension TwoLabelsAndButtonCell {
    
    func setupViews() {
        backgroundColor = .systemBackground
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            secondLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 9),
            
            button.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor),
            button.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 21),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 23.5),
        ])
    }
}

// MARK: - Public func

extension TwoLabelsAndButtonCell {
    
    public func updateView(with configuration: TwoLabelsAndButtonConfiguration, repository: Repository?) {
        self.firstLabel.text = configuration.firstText
        self.secondLabel.text = configuration.secondText
        self.button.updateView(with: ButtonViewConfiguration(buttonTitle: configuration.buttonText))
    }
}
