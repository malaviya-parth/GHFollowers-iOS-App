//
//  GFAlertVCViewController.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 05/03/25.
//

import UIKit

class GFAlertVCViewController: UIViewController {

    let container = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fonstSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    let padding: CGFloat = 20
    
    init(alertTitle: String?, message: String?, buttonTitle: String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureContainer()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    func configureContainer() {
        view.addSubview(container)
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 16
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.white.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint (equalTo: view.centerYAnchor),
            container.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            container.widthAnchor.constraint (equalToConstant: 280),
            container.heightAnchor.constraint (equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        container.addSubview (titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        container.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureBodyLabel() {
        container.addSubview (messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo:container.trailingAnchor,constant:-padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
