//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 09/03/25.
//

enum ItemInfotype {
    case gists, followers, repos, following
}

import UIKit

class GFItemInfoView: UIView {

    let symbolImageView  = UIImageView()
    let titleLabel       = GFTitleLabel(textAlignment: .left, fonstSize: 14)
    let countLabel       = GFTitleLabel(textAlignment: .center, fonstSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubViews(views: symbolImageView, titleLabel, countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
        
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itrmInfoType: ItemInfotype, withCount count: Int) {
        switch itrmInfoType {
        case .repos:
            symbolImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
            break
        case .followers:
            symbolImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
            break
        case .following:
            symbolImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
            break
        case .gists:
            symbolImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
            break
        }
        countLabel.text = String(count) 
    }

}
