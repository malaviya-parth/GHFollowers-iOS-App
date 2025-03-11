//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 09/03/25.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView        = UIStackView()
    let itemInfoViewOne  = GFItemInfoView()
    let itemInfoViewTwo  = GFItemInfoView()
    let actionButton     = GFButton()
    
    var user: User!
    weak var delegate: UserInfoVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
        configureActionButtonTapped()
    }
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    func configureActionButtonTapped() {
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {}
    
    func layoutUI() {
        view.addSubViews(views: stackView, actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        let padding: CGFloat  = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint (equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint (equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint (equalToConstant: 50),
        
            actionButton.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint (equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint (equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint (equalToConstant: 44)
        ])
    }
    
    func configureStackView() {
        stackView.axis          = .horizontal
        stackView.distribution  = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }

}
