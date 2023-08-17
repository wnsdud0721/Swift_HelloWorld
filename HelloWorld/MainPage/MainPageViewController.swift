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

        // TableView 구분선 없애기
        mainPageTableView.separatorStyle = .none
        
        // TableView의 delegate, dataSource 대리자 위임
        mainPageTableView.delegate = self
        mainPageTableView.dataSource = self
        
        // 빌드시에 xib가 nib
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        // TableView에 FeedTableViewCell 등록
        mainPageTableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        // 빌드시에 xib가 nib
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        // TableView에 StoryTableViewCell 등록
        mainPageTableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    }

    @IBAction func moveCreatePageVC(_ sender: Any) {
        guard let moveCreatePageVC = self.storyboard?.instantiateViewController(identifier: "CreatePageViewController") else {return}
        moveCreatePageVC.modalTransitionStyle = .coverVertical
        moveCreatePageVC.modalPresentationStyle = .fullScreen
        self.present(moveCreatePageVC, animated: true, completion: nil)
    }
}

// TableView Extension
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView에 보여질 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 스토리 개수 + 피드 개수
        let numberOfRows = 1 + feedListData.count
        
        return numberOfRows
    }
    
    // 각 cell이 어떻게 보여질 것인가
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 가장 윗줄에 story 보여주기
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
            
            //feedTableViewCell.selectionStyle = .none
            
            // 피드 리스트의 0번째 배열부터 보여주기 위해서 indexPath.row - 1
            feedTableViewCell.feedSetUp(with: feedListData[indexPath.row - 1])
            
            return feedTableViewCell
        }
    }
    
    // TableViewCell의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 111
        }
        else {
            return 540
        }
    }
    
    // 테이블 뷰의 특정 셀이 화면에 나타나기 직전에 실행되는 코드
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let storyTableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
//        storyTableViewCell.setStoryCollectionView(dataSourceDelegate: self, forRow: indexPath.row)
        storyTableViewCell.setStoryCollectionView(dataSourceDelegate: self)
    }
}

// CollectionView Extension
extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let storyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        storyCollectionViewCell.storySetUp(with: storyListData[indexPath.row])
        return storyCollectionViewCell
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    
    // CollectionViewCell 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 103)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
