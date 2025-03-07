//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 05/03/25.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Response", message: errorMessage?.rawValue ?? "Unexpected Error Occurred", buttonTitle: "OK")
                return
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
