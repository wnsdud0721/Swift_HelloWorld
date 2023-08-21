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
    
    
    func storySetUp(with storyElement: Friend) {
        storyUserName.text = storyElement.name
        storyUserProfile.image = storyElement.profileName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // 프로필 원형으로 만들기
        storyUserProfile.layer.cornerRadius = storyUserProfile.frame.height/2
    }
}
