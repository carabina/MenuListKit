//
//  ViewController.swift
//  MenuListKit
//

import UIKit
import MenuListKit
import IGListKit

class DemoViewController: UIViewController {
    
    var oldItems: [BaseItem & ListDiffable] = [
    ListItem(title: "Vincolo", subtitle: "Beta"),
    ListItem(title: "Circo", subtitle: "Ricco"),
    ListItem(title: "Grumo", subtitle: "Bruno"),
    ListItem(title: "222Creta", subtitle: "Beta"),
    ListItem(title: "222Circo", subtitle: "Ricco")
    ]
    
    var newItems: [BaseItem & ListDiffable] = [
        ListItem(title: "Vincolo", subtitle: "Beta"),
        ListItem(title: "Circo", subtitle: "Ricco"),
        ListItem(title: "Grumo", subtitle: "Bruno nonononono"),
        ListItem(title: "222Creta", subtitle: "Beta"),
        ListItem(title: "222Circo", subtitle: "Ricco")
    ]
    
    @IBAction func reloadData(_ sender: Any) {
        oldItems = newItems
        adapter.performUpdates(animated: true,completion: nil)
    }
    
    var menuGroup: MenuGroup!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: MenuListAdapter = {
        return MenuListAdapter(viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DemoViewController: MenuListAdapterDataSource {
    
    func objects(for menuListAdapter: MenuListAdapter) -> [ListDiffable & BaseItem] {
        
        return [
            MenuGroup(identifier:"menu",
                      header: nil,
                      items: oldItems,
                      emptyItem: ListItem(title: "No iTems", subtitle: "Beta"),
                      marginTop: 40,
                      marginBottom: 100,
                      spaceBetweenCells: 0)
        ]
        
    }
    
    func emptyView(for menuListAdapter: MenuListAdapter) -> UIView? {
        return nil
    }
    
}

