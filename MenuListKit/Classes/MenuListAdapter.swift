//
//  ViewController.swift
//  List
//

import UIKit
import IGListKit

open class MenuListAdapter: NSObject {
    
    private let adapter: ListAdapter
    
    /**
     The object that acts as the data source for the adapter.
     */
    weak open var dataSource: MenuListAdapterDataSource? {
        didSet {
            adapter.dataSource = self
        }
    }
    
    /**
     The collection view used with the adapter.
     */
    weak open var collectionView: UICollectionView? {
        didSet {
            adapter.collectionView = collectionView
        }
    }
    
    public init(viewController: UIViewController) {
        adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: viewController)
        super.init()
    }
    
    public func performUpdates(animated: Bool, completion: ListUpdaterCompletion? = nil) {
        adapter.performUpdates(animated: animated, completion: completion)
    }
    
    public func section(for sectionController: ListSectionController) -> Int {
        return adapter.section(for: sectionController)
    }
    
    public func object(atSection section: Int) -> Any? {
        return adapter.object(atSection: section)
    }
    
}

extension MenuListAdapter: ListAdapterDataSource {
    
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let dataSource = dataSource else {
            fatalError("Maybe you forgot to set the dataSource")
        }
        return dataSource.objects(for: self)
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let menu = object as? MenuGroup {
            return MenuGroupSectionController(object: menu)
        } else {
             return BaseMenuItemSectionController()
        }
    }
    
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        guard let dataSource = dataSource else {
            fatalError("Maybe you forgot to set the dataSource")
        }
        return dataSource.emptyView(for: self)
    }
    
}

public protocol MenuListAdapterDataSource: class {
    func objects(for menuListAdapter: MenuListAdapter) -> [BaseMenuItem & ListDiffable]
    func emptyView(for menuListAdapter: MenuListAdapter) -> UIView?
}
