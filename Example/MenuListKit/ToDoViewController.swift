//
//  ToDoViewController.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 18/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import IGMenuListKit
import IGListKit

class ToDoViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var adapter: MenuListAdapter = {
        return MenuListAdapter(viewController: self)
    }()
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "No more todo"
        label.backgroundColor = .clear
        return label
    }()
    
    let todos = [
    
        ToDoItem(text: "Clean up my room",
                 isCompleted: false),
        
        ToDoItem(text: "Buy 3 apples",
                 isCompleted: true),
        
        ToDoItem(text: "Plan my next trip",
                 isCompleted: true),
        
        ToDoItem(text: "Book a hotel room in Rome",
                 isCompleted: false)
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ToDoViewController: MenuListAdapterDataSource {
    
    func objects(for menuListAdapter: MenuListAdapter) -> [ListDiffable & BaseMenuItem] {
        return todos
    }
    
    func emptyView(for menuListAdapter: MenuListAdapter) -> UIView? {
        return emptyLabel
    }
    
}
