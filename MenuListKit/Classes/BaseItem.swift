//
//  File.swift
//  MenuListKit
//

import Foundation
import IGListKit

public protocol BaseItem: class {
    
    var height: CGFloat { get }
    var cell: Resource { get }
    var actionDelegate: MenuActionDelegate? { get }
    var cellType: AnyClass { get }
    
    func bind(to cell: UICollectionViewCell)
}
