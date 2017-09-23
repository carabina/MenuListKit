//
//  HeaderItem.swift
//  MenuListKit
//

import Foundation
import MenuListKit
import IGListKit

class HeaderItem: AdapterItem<HeaderCell>, ListDiffable {
    
    let title: String
    
    init(title: String) {
        self.title = title
        super.init(height: 20)
    }
    
    override func bind(to cell: HeaderCell) {
        cell.text = title
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object,
            let obj = object as? HeaderItem else { return false }
        return title == obj.title
    }
    
}
