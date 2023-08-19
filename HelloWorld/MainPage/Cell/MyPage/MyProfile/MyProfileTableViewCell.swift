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
    
    @IBOutlet weak var EditMyPageButton: UIButton!
    
    
    func myProfileSetup() {
        userName.text = userInfoData[0].userName
        
        userImage.image = userInfoData[0].profileImageName as? UIImage
        
        postCount.text = "\(feedCount)"
        userInfo.text = userInfoData[0].info
    }


  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }

}

