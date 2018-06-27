//
//  TwitterMenuViewController.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 11/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import IGMenuListKit
import IGListKit

class TwitterMenuViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var adapter: MenuListAdapter = {
        return MenuListAdapter(viewController: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
}

extension TwitterMenuViewController: MenuListAdapterDataSource {
    
    func objects(for menuListAdapter: MenuListAdapter) -> [ListDiffable & BaseMenuItem] {
        return [
        
            ProfileHeaderItem(fullName: "MoonCoders",
                              username: "@MoonCoders",
                              followers: 1000,
                              following: 1000,
                              avatar: #imageLiteral(resourceName: "moon"))
            
        ]
    }
    
    func emptyView(for menuListAdapter: MenuListAdapter) -> UIView? {
        return nil
    }
    
}
