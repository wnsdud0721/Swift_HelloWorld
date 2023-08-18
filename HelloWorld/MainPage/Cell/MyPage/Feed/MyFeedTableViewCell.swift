//
//  FeedTableViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class MyFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
        
        let feedNib = UINib(nibName: "MyFeedCollectionViewCell", bundle: nil)
        feedCollectionView.register(feedNib, forCellWithReuseIdentifier: "MyFeedCollectionViewCell")
        
        feedCollectionView.reloadData()
    }
}

extension MyFeedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userInfoData[0].myFeedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "MyFeedCollectionViewCell", for: indexPath) as! MyFeedCollectionViewCell
        
        let feedInfo = userInfoData[0].myFeedList[indexPath.row]
        
        cell.feedSetup(myFeedImage: feedInfo)
        
        return cell
    }
}

extension MyFeedTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
