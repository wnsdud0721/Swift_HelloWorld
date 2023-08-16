//
//  MainPageViewController.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/14.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet var mainPageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mainPageTableView.separatorStyle = .none
        
        mainPageTableView.delegate = self
        mainPageTableView.dataSource = self
        
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        mainPageTableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        mainPageTableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    }

}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let storyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            return storyTableViewCell
        }
        else {
            guard let feedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            feedTableViewCell.selectionStyle = .none
            return feedTableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 111
        }
        else {
            return 540
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let storyTableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        storyTableViewCell.setStoryCollectionView(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let storyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return storyCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 103)
    }
}
