//
//  CountCell.swift
//  MenuListKit_Example
//

import UIKit

class CountCell: UICollectionViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var button: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor.blue
        label.textAlignment = .center
        label.text = "Remove"
        self.contentView.addSubview(label)
        return label
    }()
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .white
        let bounds = contentView.bounds
        let divide = bounds.divided(atDistance: 100, from: .maxXEdge)
        label.frame = divide.slice.insetBy(dx: 15, dy: 0)
        button.frame = divide.remainder
    }
    
}
