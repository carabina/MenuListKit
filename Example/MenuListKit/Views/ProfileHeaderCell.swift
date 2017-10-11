//
//  ProfileHeaderCell.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 11/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var followingNumberLabel: UILabel!
    @IBOutlet private weak var followingTagLabel: UILabel!
    @IBOutlet private weak var followerNumberLabel: UILabel!
    @IBOutlet private weak var followerTagLabel: UILabel!
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    var fullName: String? {
        get { return fullNameLabel.text }
        set { fullNameLabel.text = newValue }
    }
    
    var username: String? {
        get { return usernameLabel.text }
        set { usernameLabel.text = newValue }
    }
    
    var numberOfFollowers: Int = 0 {
        didSet {
            followerNumberLabel.text = "\(numberOfFollowers)"
        }
    }
    
    var numberOfFollowing: Int = 0 {
        didSet {
            followingNumberLabel.text = "\(numberOfFollowing)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        self.contentView.backgroundColor = .white
    }
    
    private func configure() {
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.masksToBounds = false
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        usernameLabel.font = UIFont.systemFont(ofSize: 13)
        followingNumberLabel.font = UIFont.boldSystemFont(ofSize: 13)
        followingTagLabel.font = UIFont.systemFont(ofSize: 13)
        followerNumberLabel.font = UIFont.boldSystemFont(ofSize: 13)
        followerTagLabel.font = UIFont.systemFont(ofSize: 13)
        
        followerTagLabel.text = "Follower"
        followingTagLabel.text = "Following"
    }
    
}
