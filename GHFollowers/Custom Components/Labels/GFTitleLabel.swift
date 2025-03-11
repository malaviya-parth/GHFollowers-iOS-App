//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 05/03/25.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fonstSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fonstSize, weight: .bold)
    }
    
    func configure() {
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byTruncatingTail
    }
}
