//
//  ItemCell.swift
//  MenuListKit_Example
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    fileprivate static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    fileprivate static let font = UIFont.systemFont(ofSize: 17)
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = ItemCell.font
        return label
    }()
    
    let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1).cgColor
        return layer
    }()
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.addSublayer(separator)
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = contentView.bounds
        label.frame = UIEdgeInsetsInsetRect(bounds, ItemCell.insets)
        let height: CGFloat = 0.5
        let left = ItemCell.insets.left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentView.backgroundColor = UIColor(white: isHighlighted ? 0.9 : 1, alpha: 1)
        }
    }
    
}
