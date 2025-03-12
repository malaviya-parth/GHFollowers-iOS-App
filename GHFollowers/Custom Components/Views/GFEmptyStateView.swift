//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 08/03/25.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel  = GFTitleLabel(textAlignment: .center, fonstSize: 28)
    let imageView     = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure() {
        addSubViews(views: messageLabel, imageView)
        
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel
        imageView.image             = UIImage(resource: .emptyStateLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.2),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.2),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 220),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 80),
            
        ])
    }

}
