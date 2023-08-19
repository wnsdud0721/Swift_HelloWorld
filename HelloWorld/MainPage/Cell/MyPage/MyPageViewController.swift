//
//  MyPageViewController.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/18.
//

import UIKit

class MyPageViewController: UIViewController, UINavigationControllerDelegate {
    



 
    @IBAction func dismissMyPage(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)

    }
    
    @IBOutlet weak var myPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageTableView.dataSource = self
        myPageTableView.delegate = self
        myPageTableView.delegate = self
        
        let myProfileNib = UINib(nibName: "MyProfileTableViewCell", bundle: nil)
        myPageTableView.register(myProfileNib, forCellReuseIdentifier: "MyProfileTableViewCell")
        
        let friendNib = UINib(nibName: "FriendTableViewCell", bundle: nil)
        myPageTableView.register(friendNib, forCellReuseIdentifier: "FriendTableViewCell")
        
        let feedNib = UINib(nibName: "MyFeedTableViewCell", bundle: nil)
        myPageTableView.register(feedNib, forCellReuseIdentifier: "MyFeedTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        myPageTableView.reloadData()
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    @objc func a() {
        let editMy = UIStoryboard.init(name: "EditMyPage", bundle: nil)
         guard let editMyController = editMy.instantiateViewController(withIdentifier: "EditMyPage")as? EditMyPageViewController else {return}

        editMyController.modalPresentationStyle = .fullScreen
        self.present(editMyController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        if indexPath.row == 0 {
            guard let myProfileTableView = myPageTableView.dequeueReusableCell(withIdentifier: "MyProfileTableViewCell", for: indexPath) as? MyProfileTableViewCell else {
                return UITableViewCell()
            }
            myProfileTableView.myProfileSetup(myInfo: userInfoData[0])
            myProfileTableView.EditMyPageButton.tag = indexPath.row
            myProfileTableView.EditMyPageButton.addTarget(self, action: #selector(a), for: .touchUpInside)

            return myProfileTableView
        }
        else if indexPath.row == 1 {
            guard let friendProfileTableView = myPageTableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell else {
                return UITableViewCell()
            }


            return friendProfileTableView
        }
        else {
            guard let feedTableView = myPageTableView.dequeueReusableCell(withIdentifier: "MyFeedTableViewCell", for: indexPath) as? MyFeedTableViewCell else {
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
