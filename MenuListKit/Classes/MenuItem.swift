//
//  ListItem.swift
//  Pods
//

import Foundation
import IGListKit

open class MenuItem<Cell: UICollectionViewCell>: BaseMenuItem {

    // MARK: - Internal properites
    
    public let cell: Resource
    
    public var cellType: AnyClass {
        return Cell.self
    }

    // MARK: - Public properties
    
    public var height: CGFloat
    
    public weak var actionDelegate: MenuActionDelegate?
    
    // MARK: - Initializer
    
    public init(height: CGFloat,
                actionDelegate: MenuActionDelegate? = nil) {
        self.cell = .`class`
        self.height = height
        self.actionDelegate = actionDelegate
    }
    
    public init(xibIdentifier: String = String(describing: Cell.self),
                bundle: Bundle,
                height: CGFloat,
                actionDelegate: MenuActionDelegate?) {
        self.cell = .xib(identifier: xibIdentifier, bundle: bundle)
        self.height = height
        self.actionDelegate = actionDelegate
    }
    
    open func bind(to cell: Cell) { }
    
    public func bind(to cell: UICollectionViewCell) {
        guard let listItemCell = cell as? Cell else { return }
        bind(to: listItemCell)
    }
    
}

extension UICollectionViewCell: ListBindable {
    
    public func bindViewModel(_ viewModel: Any) {
        if let adapterItem = viewModel as? BaseMenuItem {
            adapterItem.bind(to: self)
        }
    }
}
