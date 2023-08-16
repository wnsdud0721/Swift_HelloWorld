//
//  StoryCollectionViewCell.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet var storyUserProfile: UIImageView!
    @IBOutlet var storyUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        storyUserProfile.layer.cornerRadius = storyUserProfile.frame.height/2
    }

}
