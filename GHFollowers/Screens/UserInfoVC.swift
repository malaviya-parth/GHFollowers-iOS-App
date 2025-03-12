//
//  UserInfoVCViewController.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 08/03/25.
//

import UIKit
import SafariServices

protocol UserInfoVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollwers(for user: User)
}

class UserInfoVC: UIViewController {
    
    let headerView   = UIView()
    let itemViewOne  = UIView()
    let itemViewTwo  = UIView()
    
    var username: String = ""
    weak var delegate: FollowerListVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
        getUserInfo()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func layoutUI() {
        view.addSubViews(views: headerView, itemViewOne, itemViewTwo)
        
        headerView.translatesAutoresizingMaskIntoConstraints   = false
        itemViewOne.translatesAutoresizingMaskIntoConstraints  = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints  = false
        
        let padding: CGFloat = 30
        let itemHeight: CGFloat = 140
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint (equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint (equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint (equalToConstant: 150),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    private func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
                
            case .failure(let message):
                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: message.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureUIElements (with user: User) {
        let repoItemVC = GFRepoItemVC(user: user)
        repoItemVC.delegate  = self
        
        let followerItemVC = GFFollowerItem(user: user)
        followerItemVC.delegate = self
    
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame =  containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}

extension UserInfoVC: UserInfoVCDelegate {
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid User URL", message: "Url provided for htis user is wrong", buttonTitle: "OK")
            return
        }
        presentSafariVC(with: url)
        
    }
    
    func didTapGetFollwers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "User has no Followers.", buttonTitle: "OK")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
    

    
    
}
