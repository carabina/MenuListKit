//
//  ProfileHeaderItem.swift
//  MenuListKit_Example
//
//  Created by Andrea Antonioni on 11/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import IGListKit
import IGMenuListKit

class ProfileHeaderItem: MenuItem<ProfileHeaderCell>, ListDiffable {
    
    let fullName: String
    let username: String
    let followers: Int
    let following: Int
    let avatar: UIImage
    
    init(fullName: String, username: String, followers: Int, following: Int, avatar: UIImage) {
        self.fullName = fullName
        self.username = username
        self.followers = followers
        self.following = following
        self.avatar = avatar
        super.init(bundle: Bundle.main, height: 200, actionDelegate: nil)
    }
    
    override func bind(to cell: ProfileHeaderCell) {
        cell.fullName = fullName
        cell.image = avatar
        cell.username = username
        cell.numberOfFollowers = followers
        cell.numberOfFollowing = following
    }
    
    // MARK: - ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return username as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ProfileHeaderItem else { return false }
        
        return fullName == object.fullName && followers == object.followers && following == object.following && avatar == object.avatar
    }
    
}
