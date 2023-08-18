//
//  MyPageViewController.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class MyPageViewController: UIViewController {
    


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
