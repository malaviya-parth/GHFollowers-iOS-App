//
//  GFFollowerItem.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 09/03/25.
//

import UIKit

class GFFollowerItem: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itrmInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itrmInfoType: .following, withCount: user.following)
        actionButton.setBackGroundColor(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func buttonTapped() {
        delegate.didTapGetFollwers(for: user)
    }
}
