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
    
    
    var cellDelegate: ContentsMainTextDelegate?
    
    func myProfileSetup(myInfo: UserInfoList) {
        userName.text = myInfo.userName
        userImage.image = UIImage(named: myInfo.profileImageName)
        postCount.text = "\(feedCount)"
        userInfo.text = myInfo.info
    }


  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
//    class Contents_MainTextCell: UITableViewCell {
//        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            // 여기서 버튼에 액션 추가
//            self.categoryButton.addTarget(self, action: #selector(categoryClicked), for: .touchUpInside)
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        // 버튼
//
//
//        // 위임해줄 기능을 미리 구현해두어 버튼에 액션 추가
//        @objc func categoryClicked() {
//            cellDelegate?.categoryButtonTapped()
//        }
//
//    }
}
protocol ContentsMainTextDelegate: AnyObject {
    // 위임해줄 기능
    func categoryButtonTapped()
}


