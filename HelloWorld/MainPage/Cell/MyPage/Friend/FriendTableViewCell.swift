//
//  FriendTableViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        friendCollectionView.collectionViewLayout = layout
        
        friendCollectionView.dataSource = self
        friendCollectionView.delegate = self

        let friendNib = UINib(nibName: "FriendCollectionViewCell", bundle: nil)
        friendCollectionView.register(friendNib, forCellWithReuseIdentifier: "FriendCollectionViewCell")

        friendCollectionView.reloadData()
    }
    
//    func setupFriendCollectionView() {
//        friendCollectionView.dataSource = self
//        friendCollectionView.delegate = self
//
//        let friendNib = UINib(nibName: "FriendCollectionViewCell", bundle: nil)
//        friendCollectionView.register(friendNib, forCellWithReuseIdentifier: "FriendCollectionViewCell")
//
//        friendCollectionView.reloadData()
//    }
}

extension FriendTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userInfoData[0].friend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendCollectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionViewCell", for: indexPath) as! FriendCollectionViewCell
        
        let friendInfo = userInfoData[0].friend[indexPath.row]
        cell.friendSetup(friendInfo: friendInfo)
        
        return cell
    }
}

extension FriendTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 128)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
