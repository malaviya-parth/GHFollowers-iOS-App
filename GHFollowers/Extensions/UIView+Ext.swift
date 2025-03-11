//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 11/03/25.
//

import UIKit

extension UIView {
    
    func addSubViews(views: UIView...) {
        for view in views { addSubview(view) }
    }

}
