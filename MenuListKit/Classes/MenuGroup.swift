//
//  MenuGroup.swift
//  Pods
//

import Foundation
import IGListKit
import IGListKit

open class MenuGroup: BaseItem, ListDiffable {
    
    public var cell: Resource {
        return .class
    }
    
    public var cellType: AnyClass {
        return MenuGroup.self
    }

    public var height: CGFloat = 0.0
    
    public var tapAction: Action?
    
    public var identifier: String
    
    public func bind(to cell: UICollectionViewCell) { }

    let uuid = UUID()
    
    let header: (BaseItem & ListDiffable)?
    let items: [BaseItem & ListDiffable]
    let emptyItem: (BaseItem & ListDiffable)?
    
    let marginTop: CGFloat
    let marginBottom: CGFloat
    let spaceBetweenCells: CGFloat
    
    public init(identifier: String,
         header: (BaseItem & ListDiffable)?,
         items: [BaseItem & ListDiffable],
         emptyItem: (BaseItem & ListDiffable)? = nil,
         marginTop: CGFloat = 0,
         marginBottom: CGFloat = 0,
         spaceBetweenCells: CGFloat = 0) {
        self.identifier = identifier
        self.header = header
        self.emptyItem = emptyItem
        self.items = items
        self.marginTop = marginTop
        self.marginBottom = marginBottom
        self.spaceBetweenCells = spaceBetweenCells
    }
    
    public func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard (object as? MenuGroup) != nil else { return false }
        return true
    }
    
}
