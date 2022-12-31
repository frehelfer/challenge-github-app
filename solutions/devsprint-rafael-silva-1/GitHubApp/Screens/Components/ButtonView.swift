import UIKit

struct ButtonViewConfiguration {
    let buttonTitle: String
}

class ButtonView: UIView {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        return button
    }()
    
    init () {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ButtonView {
    
    func setupViews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(button)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([

            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 56),
            
        ])
    }
    
}

extension ButtonView {
    
    public func updateView (with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.buttonTitle, for: .normal)
    }
    
}
