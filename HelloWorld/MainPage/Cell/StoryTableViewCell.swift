//
//  StoryTableViewCell.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet var storyCollectionView: UICollectionView!
    
    func setStoryCollectionView (dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        storyCollectionView.dataSource = dataSourceDelegate
        storyCollectionView.delegate = dataSourceDelegate
        storyCollectionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        storyCollectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        let storyFlowLayout = UICollectionViewFlowLayout()
        storyFlowLayout.scrollDirection = .horizontal
        storyFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        storyFlowLayout.minimumLineSpacing = 12
        
        storyCollectionView.collectionViewLayout = storyFlowLayout
        
        storyCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
