//
//  ListItemCell.swift
//  List
//

import UIKit

class ListItemCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
        
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }    
}
