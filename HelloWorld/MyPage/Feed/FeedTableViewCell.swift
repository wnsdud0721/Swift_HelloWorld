//
//  FeedTableViewCell.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
        
        let feedNib = UINib(nibName: "FeedCollectionViewCell", bundle: nil)
        feedCollectionView.register(feedNib, forCellWithReuseIdentifier: "FeedCollectionViewCell")
        
        feedCollectionView.reloadData()
    }
}

extension FeedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyPageViewController.userInfoData.myFeedList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath) as! FeedCollectionViewCell
        
        if let feedInfo = MyPageViewController.userInfoData.myFeedList?[indexPath.row] {
            cell.feedSetup(myFeedImage: feedInfo)
        }
        
        return cell
    }
}

extension FeedTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
