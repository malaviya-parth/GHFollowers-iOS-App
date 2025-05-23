//
//  GFButton.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 04/03/25.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setBackGroundColor(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }

}
