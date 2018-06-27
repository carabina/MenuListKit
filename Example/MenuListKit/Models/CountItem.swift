//
//  CountItem.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 10/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import IGMenuListKit
import IGListKit

class CountItem: MenuItem<CountCell>, ListDiffable {
    
    let number: Int
    
    init(number: Int, actionDelegate: MenuActionDelegate?) {
        self.number = number
        super.init(height: 55, actionDelegate: actionDelegate)
    }
    
    override func bind(to cell: CountCell) {
        cell.text = "Cell: \(number)"
    }
    
    // MARK: - ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return number as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
    
}
