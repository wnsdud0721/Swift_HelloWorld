//
//  CustomTableViewCell.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    

    @IBOutlet weak var userImageCell: UIImageView!
    @IBOutlet weak var commentCell: UILabel!
    @IBOutlet weak var userNameCell: UILabel!
    
    override func awakeFromNib() {
        userImageCell.layer.cornerRadius = userImageCell.frame.height/2
        super.awakeFromNib()
        
    }
}


