//
//  MyPageViewController.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class MyPageViewController: UIViewController {
    
    static var userInfoData : UserInfoList = UserInfoList(userName : "스폰지밥", profileImageName: "스폰지밥", friend: friends, info: "개발자가 되고 싶은 김민수 입니다.", myFeedList: [FeedList(title : "맛있는 하루", content: "대충 맛있는 곳", feedImageName: "집게리아", commentIndex : [comment( commentContent: "댓글1", userName: "김민수")]),FeedList(title : "맛있는 이틀", content: "그런곳", feedImageName: "집게리아", commentIndex : [comment( commentContent: "댓글1", userName: "김민수"),comment( commentContent: "댓글2", userName: "김민수"),comment( commentContent: "댓글3", userName: "김영미"),comment( commentContent: "댓글4", userName: "김영미")]), FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아"),FeedList(title: "맛있는 삼일", content: "좋은 곳", feedImageName: "집게리아")])

    static var friends: [[UserInfoList]] = [[UserInfoList(userName: "김도윤", profileImageName: "https://i.namu.wiki/i/X08sSZyh-N9jxsAPpykSkFXnygOBr6ig4-wkO-abIUJJVUHUxSqG5eiIJWa73Cakv7VazNZglafDztek9XuSNkHUQBaJJIHjPacEKmuZVtKKNyk58GocBEK7kJGpBtEXcZrWHtarCYu5_24lmAyK7Q.webp", info: "안녕하세요")], [UserInfoList(userName: "홍준영", profileImageName: "https://i.namu.wiki/i/O8gyhQz5s_oAph7O5vl6JdbQZ7Ayqe9oabW-518fqiqTZ72sANug28FXHKsv4RMtIzOf0ttv5bssT6YsfwrIcY7Ktta-C96WwoF_Ih5Xxnp-Iy4iDRrXBTsNd4igWT2ng5breydME_Q7i-Sfa17nZQ.webp", info: "안녕하세요")], [UserInfoList(userName: "정동교", profileImageName: "https://i.namu.wiki/i/zTwi9KZNi29pV9XLm8-t4uOAO0-J7-OT3T0QdWaAufmnei2rGAsjF4P5dcYIDf8mdZztTj8fLMzRLADXuYiyvragEHas4-UefHZXdGi6bWslNXOZlcRhJjCBuL5IkLEDs3NRKC3Rwl-1zK-lG1WC5g.webp", info: "안녕하세요")], [UserInfoList(userName: "정하진", profileImageName: "https://i.namu.wiki/i/7L9dy2GsbEZirUCRpb9FgZWCzCZH70u1rF1xphR-I5vqHPIa9sSTVP9SSxj9XOwVGMU7LCxmEtvUY1ziCYr8xxdEtwzhniRMnAugJ894oUyouaC0tCwPIlK4jENd3Ptjjd5LeBl_bFvaWh7vCHGreA.webp", info: "안녕하세요")]]


    static var friend: [Friend] = [
        Friend(name: "홍준영", profileName: "뚱이"),
        Friend(name: "정동교", profileName: "징징이"),
        Friend(name: "정하진", profileName: "다람이"),
        Friend(name: "김도윤", profileName: "집게사장")]


    @IBOutlet weak var myPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageTableView.dataSource = self
        myPageTableView.delegate = self
        
        let myProfileNib = UINib(nibName: "MyProfileTableViewCell", bundle: nil)
        myPageTableView.register(myProfileNib, forCellReuseIdentifier: "MyProfileTableViewCell")
        
        let friendNib = UINib(nibName: "FriendTableViewCell", bundle: nil)
        myPageTableView.register(friendNib, forCellReuseIdentifier: "FriendTableViewCell")
        
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        myPageTableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let myProfileTableView = myPageTableView.dequeueReusableCell(withIdentifier: "MyProfileTableViewCell", for: indexPath) as? MyProfileTableViewCell else {
                return UITableViewCell()
            }
            myProfileTableView.myProfileSetup(myInfo: MyPageViewController.userInfoData)
            
            return myProfileTableView
        }
        else if indexPath.row == 1 {
            guard let friendProfileTableView = myPageTableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell else {
                return UITableViewCell()
            }
            
            
            return friendProfileTableView
        }
        else {
            guard let feedTableView = myPageTableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            return feedTableView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 295
        }
        else if indexPath.row == 1 {
            return 128
        }
        else {
            return 500
        }
    }
}
