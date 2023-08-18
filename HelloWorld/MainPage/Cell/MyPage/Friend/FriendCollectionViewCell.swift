//
//  FriendCollectionViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendName: UILabel!
    
    @IBOutlet weak var friendImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendImage.layer.cornerRadius = friendImage.frame.height / 2
    }
    
    func friendSetup(friendInfo: Friend) {
        friendName.text = friendInfo.name
        friendImage.image = UIImage(named: friendInfo.profileName)
    }
}
