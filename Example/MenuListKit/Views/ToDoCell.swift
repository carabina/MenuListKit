//
//  ToDoCell.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 18/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class ToDoCell: UICollectionViewCell {

    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var textLabel: UILabel!
    
    var text: String? {
        get { return textLabel.text }
        set { textLabel.text = newValue }
    }
    
    var isCompleted: Bool = false {
        didSet {
            statusLabel.text = isCompleted ? "✅" : "⏺"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isCompleted = false
    }

}
