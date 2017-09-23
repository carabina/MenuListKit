//
//  File.swift
//  MenuListKit
//

import Foundation
import IGListKit

public typealias Action = ()->()

public protocol BaseItem: class {
    
    var height: CGFloat { get }
    var cell: Resource { get }
    var tapAction: Action? { get }
    var cellType: AnyClass { get }
    
    func bind(to cell: UICollectionViewCell)
}
