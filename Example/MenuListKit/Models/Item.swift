//
//  Item.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 10/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import IGMenuListKit
import IGListKit

class Item: MenuItem<ItemCell>, ListDiffable {
    
    let text: String
    let controller: UIViewController.Type
    
    init(text: String, controller: UIViewController.Type, actionDelegate: MenuActionDelegate?) {
        self.text = text
        self.controller = controller
        super.init(height: 55, actionDelegate: actionDelegate)
    }
    
    override func bind(to cell: ItemCell) {
        cell.text = text
    }
    
    // MARK: - ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return text as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? Item {
            return text == object.text
        }
        return false
    }
    
}
