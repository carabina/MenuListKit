//
//  SearchViewController.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 10/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import IGMenuListKit
import IGListKit

class EmptyViewController: UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var adapter: MenuListAdapter = {
       return MenuListAdapter(viewController: self)
    }()
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "No more data!"
        label.backgroundColor = .clear
        return label
    }()
    
    var tally = 4
    
    lazy var data: [CountItem] = {
        return [
            CountItem(number: 1, actionDelegate: self),
            CountItem(number: 2, actionDelegate: self),
            CountItem(number: 3, actionDelegate: self),
            CountItem(number: 4, actionDelegate: self)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(self.onAdd))
        
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
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
    
    @objc func onAdd() {
        data.append(CountItem(number: tally + 1, actionDelegate: self))
        tally += 1
        adapter.performUpdates(animated: true, completion: nil)
    }

}

extension EmptyViewController: MenuListAdapterDataSource {
    
    func objects(for menuListAdapter: MenuListAdapter) -> [ListDiffable & BaseMenuItem] {
        return [
            
            MenuGroup(identifier: "ciao",
                      header: nil,
                      items: data,
                      emptyItem: nil,
                      marginTop: 0,
                      marginBottom: 0,
                      spaceBetweenCells: 10)
        
        ]
    }
    
    func emptyView(for menuListAdapter: MenuListAdapter) -> UIView? {
        return emptyLabel
    }
    
}

extension EmptyViewController: MenuActionDelegate {
    
    func didSelect(item: BaseMenuItem) {
        guard let countItem = item as? CountItem else { return }
        let index = data.index { $0.number == countItem.number }
        guard let unwrappedIndex = index else { return }
        data.remove(at: unwrappedIndex)
        adapter.performUpdates(animated: true, completion: nil)
    }
    
}
