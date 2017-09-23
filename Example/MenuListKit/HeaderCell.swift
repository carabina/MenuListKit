//
//  HeaderCell.swift
//  MenuListKit
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    private var textLabel: UILabel!
    
    static let height: CGFloat = 16
    
    var text: String? {
        set {
            textLabel.text = newValue
        }
        get {
            return textLabel.text
        }
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        textLabel = UILabel()
        self.contentView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        let margins = self.layoutMarginsGuide
        
        textLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    }
    
}
