//
//  CustomTableViewCell.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    @IBOutlet weak var userImageCell: UIImageView!
    @IBOutlet weak var commentCell: UILabel!
    @IBOutlet weak var userNameCell: UILabel!
    
    
  // 여긴 추가 안할거야
    
}
