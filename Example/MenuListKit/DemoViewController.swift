//
//  ViewController.swift
//  MenuListKit
//

import UIKit
import IGMenuListKit
import IGListKit

class DemoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: MenuListAdapter = {
        return MenuListAdapter(viewController: self)
    }()
    
    lazy var items: [ListDiffable & BaseMenuItem] = [
        Item(text: "Empty View", controller: EmptyViewController.self, actionDelegate: self),
        Item(text: "Twitter Menu", controller: TwitterMenuViewController.self, actionDelegate: self),
        Item(text: "ToDo", controller: ToDoViewController.self, actionDelegate: self)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        self.title = "Demos"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DemoViewController: MenuListAdapterDataSource {
    
    func objects(for menuListAdapter: MenuListAdapter) -> [ListDiffable & BaseMenuItem] {
        return items
    }
    
    func emptyView(for menuListAdapter: MenuListAdapter) -> UIView? {
        return nil
    }
    
}

extension DemoViewController: MenuActionDelegate {
    
    func didSelect(item: BaseMenuItem) {
        guard let demoItem = item as? Item else { return }
        let controller = demoItem.controller.init()
        controller.title = demoItem.text
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
