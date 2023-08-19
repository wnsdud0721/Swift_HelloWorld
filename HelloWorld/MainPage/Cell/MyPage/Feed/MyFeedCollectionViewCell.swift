//
//  FeedCollectionViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class MyFeedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var feedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func feedSetup(myFeedImage: feedList) {
        feedImage.image = UIImage(named: myFeedImage.feedImageName as! String)
    }

}
