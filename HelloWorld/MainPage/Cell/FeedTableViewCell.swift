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
    
    var feedLikeBtnState = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        feedUserProfile.layer.cornerRadius = feedUserProfile.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickFeedLikeBtn(_ sender: Any) {
        
        if feedLikeBtnState {
            feedLikeBtn.setImage(UIImage(named: "like.fill"), for: .normal)
        }
        
        else {
            feedLikeBtn.setImage(UIImage(named: "like.empty"), for: .normal)
        }
        
        feedLikeBtnState.toggle()
    }
    
}
