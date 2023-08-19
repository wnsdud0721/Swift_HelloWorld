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
        
        
        // TableView 구분선 없애기
        mainPageTableView.separatorStyle = .none
        
        // TableView의 delegate, dataSource 대리자 위임
        mainPageTableView.delegate = self
        mainPageTableView.dataSource = self
        
        // 빌드시에 xib가 nib
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        // TableView에 FeedTableViewCell 등록
        mainPageTableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")

        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        // TableView에 StoryTableViewCell 등록
        mainPageTableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")

        let seperateNib = UINib(nibName: "SeperateTableViewCell", bundle: nil)
        // TableView에 SeperateTableViewCell 등록
        mainPageTableView.register(seperateNib, forCellReuseIdentifier: "SeperateTableViewCell")
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainPageTableView.reloadData()
    }
    
    @IBAction func moveMyPage(_ sender: Any) {
        let tabMyPage = UIStoryboard.init(name: "MyPage", bundle: nil)
         guard let MyPagController = tabMyPage.instantiateViewController(withIdentifier: "MyPage")as? MyPageViewController else {return}
         
        MyPagController.modalPresentationStyle = .fullScreen
         self.present(MyPagController, animated: true, completion: nil)
    }
    
    @IBAction func moveCreatePageVC(_ sender: Any) {
//        guard let moveCreatePageVC = self.storyboard!.instantiateViewController(withIdentifier: "DetailPage") as? DetailPageViewController else {return}
//        moveCreatePageVC.modalTransitionStyle = .coverVertical
//        moveCreatePageVC.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(moveCreatePageVC, animated: true)

        // 구글 검색용
        let tabbar = UIStoryboard.init(name: "CreatePage", bundle: nil)
         guard let tabBarController = tabbar.instantiateViewController(withIdentifier: "CreatePage")as? ViewController else {return}
         
         tabBarController.modalPresentationStyle = .fullScreen
         self.present(tabBarController, animated: true, completion: nil)
    }
}


// TableView Extension
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView에 보여질 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 스토리 개수 + 구분선 개수 + 피드 개수
        let numberOfRows = 2 + userInfoData[0].myFeedList.count
        
        return numberOfRows
    }
    
    // 각 cell이 어떻게 보여질 것인가
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        feedDetailButton
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Contents_UserInfoCell",for: indexPath) as! Contents_UserInfoCell
//
//         cell.mannerInfo.tag = indexPath.row
//         cell.mannerInfo.addTarget(self, action: #selector(mannerClicked), for: .touchUpInside)
//
//         return cell
        
        
        
        
        
        
        // 가장 윗줄에 story 보여주기
        if indexPath.row == 0 {
            guard let storyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            return storyTableViewCell
        }
        else if indexPath.row == 1 {
            guard let seperateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SeperateTableViewCell", for: indexPath) as? SeperateTableViewCell else {
                return UITableViewCell()
            }
            return seperateTableViewCell
        }
        else {
            guard let feedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            
            // 피드 리스트의 0번째 배열부터 보여주기 위해서 indexPath.row - 2
            feedTableViewCell.feedSetUp(with: userInfoData[0].myFeedList[indexPath.row - 2])
            
            // Cell 클릭 시, 회색으로 변하지 않도록 함
            feedTableViewCell.selectionStyle = .none
            
            return feedTableViewCell
        }
    }
    
    // TableViewCell의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 107
        }
        else if indexPath.row == 1 {
            return 0.5
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 1 {
            

            dataIndex[1] = indexPath.row - 2
            
            let detail = UIStoryboard.init(name: "DetailPage", bundle: nil)
             guard let detailController = detail.instantiateViewController(withIdentifier: "DetailPage")as? DetailPageViewController else {return}
             
            detailController.modalPresentationStyle = .fullScreen
             self.present(detailController, animated: true, completion: nil)
            
            
//            guard let moveTestVC = self.storyboard?.instantiateViewController(identifier: "TestViewController") as? TestViewController else { return }
//            moveTestVC.modalTransitionStyle = .coverVertical
//            moveTestVC.modalPresentationStyle = .fullScreen
//            self.present(moveTestVC, animated: true, completion: nil)
//
//            moveTestVC.testLabel.text = userInfoData[0].myFeedList[indexPath.row - 2].title
        }
    }
}

// CollectionView Extension
extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userInfoData[0].friend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let storyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        storyCollectionViewCell.storySetUp(with: userInfoData[0].friend[indexPath.row])
        return storyCollectionViewCell
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    
    // CollectionViewCell 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 103)
    }
    
    // CollectionViewCell 섹션의 마진 값 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    // CollectionViewCell 사이의 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
