//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Parth.Malaviya on 07/03/25.
//

import UIKit

struct UIHelper {
    
    static func createThreeColunLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let screenWidth = view.safeAreaLayoutGuide.layoutFrame.width
        let padding: CGFloat = 10
        let itemSpacing: CGFloat = 4
        let availableWidth = screenWidth - ( padding * 2 ) - (itemSpacing * 2 )
        let itemWidth = availableWidth / 4
        
        let flowLayout           = UICollectionViewFlowLayout()
        flowLayout.sectionInset  = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize      = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
