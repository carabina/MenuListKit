//
//  ListItem.swift
//  List
//

import Foundation
import MenuListKit
import IGListKit

class ListItem: AdapterItem<ListItemCell>, ListDiffable {
    
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String, tapAction: Action? = nil) {
        self.title = title
        self.subtitle = subtitle
        super.init(bundle: Bundle.main, height: 100.0, tapAction: tapAction)
    }
    
    override func bind(to cell: ListItemCell) {
        cell.titleLabel.text = title
        cell.subtitleLabel.text = subtitle
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object,
            let obj = object as? ListItem else { return false }
        return title == obj.title && subtitle == obj.subtitle
    }
    
}
