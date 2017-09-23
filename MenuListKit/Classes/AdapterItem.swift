//
//  ListItem.swift
//  Pods
//

import Foundation
import IGListKit

open class AdapterItem<Cell: UICollectionViewCell>: BaseItem {

    // MARK: - Internal properites
    
    public let cell: Resource
    
    public var cellType: AnyClass {
        return Cell.self
    }

    // MARK: - Public properties
    
    public var height: CGFloat
    
    public var tapAction: Action?
    
    // MARK: - Initializer
    
    public init(height: CGFloat,
                tapAction: Action? = nil) {
        self.cell = .`class`
        self.height = height
        self.tapAction = tapAction
    }
    
    public init(xibIdentifier: String = String(describing: Cell.self),
                bundle: Bundle,
                height: CGFloat,
                tapAction: Action? = nil) {
        self.cell = .xib(identifier: xibIdentifier, bundle: bundle)
        self.height = height
        self.tapAction = tapAction
    }
    
    open func bind(to cell: Cell) { }
    
    public func bind(to cell: UICollectionViewCell) {
        guard let listItemCell = cell as? Cell else { return }
        bind(to: listItemCell)
    }
    
}

extension UICollectionViewCell: ListBindable {
    
    public func bindViewModel(_ viewModel: Any) {
        if let adapterItem = viewModel as? BaseItem {
            adapterItem.bind(to: self)
        }
    }
}
