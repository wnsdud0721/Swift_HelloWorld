//
//  FeedCollectionViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var feedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func feedSetup(myFeedImage: FeedList) {
        feedImage.image = UIImage(named: myFeedImage.feedImageName)
    }

}
