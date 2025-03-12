//
//  SearchNC.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 04/03/25.
//

import UIKit

class SearchVC: UIViewController {

    let headerImageView = UIImageView()
    let textFieldView = GFTextField()
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFieldView.text = ""
    }
    
    @objc func pushSearchData() {
        guard !textFieldView.text!.isEmpty else {
            presentGFAlertOnMainThread(title: "Enter a username", message: "We need to know who you look for 😁", buttonTitle: "Ok")
            return
        }
        let followersListVC = FollowerListVC(username: textFieldView.text ?? "")
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    // MARK: UI Setup

    func configureUI () {
        view.backgroundColor = .systemBackground
        configureTitleImage()
        configureTextField()
        configureActionButton()
        createDismissKeyboardGesture()
    }
    
    
    func createDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func configureTitleImage() {
        headerImageView.image = UIImage(resource: .ghLogo)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImageView)
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 200),
            headerImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(textFieldView)
        textFieldView.delegate = self
        
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 30),
            textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textFieldView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushSearchData), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushSearchData()
        return true
    }
}
