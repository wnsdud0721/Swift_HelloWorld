//
//  MyProfileTableViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var postCount: UILabel!
    
    @IBOutlet weak var userInfo: UILabel!
    
    func myProfileSetup(myInfo: UserInfoList) {
        userName.text = myInfo.userName
        userImage.image = UIImage(named: myInfo.profileImageName)
        postCount.text = String(myInfo.myFeedList!.count)
        userInfo.text = myInfo.info
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
}
