//
//  FeedTableViewCell.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var feedUserProfile: UIImageView!
    @IBOutlet var feedUserName: UILabel!
    @IBOutlet var feedCoverImage: UIImageView!
    @IBOutlet var feedTitle: UILabel!
    @IBOutlet var feedContent: UILabel!
    @IBOutlet var feedLikeBtn: UIButton!
    
    func feedSetUp(with feedElement: FeedList) {
        feedTitle.text = feedElement.title
        feedContent.text = feedElement.content
        feedCoverImage.image = UIImage(named: feedElement.feedImageName)
        feedUserProfile.image = UIImage(named: feedElement.userProfile)
        feedUserName.text = feedElement.userName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        feedUserProfile.layer.cornerRadius = feedUserProfile.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 좋아요 버튼 클릭 함수
    @IBAction func clickFeedLikeBtn(_ sender: Any) {
        
        if feedLikeBtn.isSelected {
            feedLikeBtn.setImage(UIImage(named: "like.fill"), for: .normal)
            feedLikeBtn.isSelected = false
        }
        
        else {
            feedLikeBtn.setImage(UIImage(named: "like.empty"), for: .normal)
            feedLikeBtn.isSelected = true
            
        }
    }
    
}
