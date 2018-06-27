//
//  ToDoItem.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 18/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import IGMenuListKit
import IGListKit

class ToDoItem: MenuItem<ToDoCell>, ListDiffable {
    
    let uuid = UUID().uuidString
    var text: String
    var isCompleted: Bool
    
    init(text: String, isCompleted: Bool) {
        self.text = text
        self.isCompleted = isCompleted
        super.init(bundle: Bundle.main,
                   height: 55,
                   actionDelegate: nil)
    }
    
    override func bind(to cell: ToDoCell) {
        cell.text = text
        cell.isCompleted = isCompleted
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return uuid as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? ToDoItem {
            return object.text == text && object.isCompleted == isCompleted
        }
        return false
    }
    
}
