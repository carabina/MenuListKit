//
//  MenuActionDelegate.swift
//  MenuListKit
//

import Foundation
import IGListKit

public protocol MenuActionDelegate: class {
    func didSelect(item: BaseMenuItem)
}
