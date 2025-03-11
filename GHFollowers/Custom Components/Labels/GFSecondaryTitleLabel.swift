//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 09/03/25.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    func configure() {
        textColor       = .secondaryLabel
        lineBreakMode   = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
