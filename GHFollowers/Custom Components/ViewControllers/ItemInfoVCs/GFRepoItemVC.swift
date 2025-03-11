//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 09/03/25.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itrmInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itrmInfoType: .gists, withCount: user.publicGists)
        actionButton.setBackGroundColor(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func buttonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
