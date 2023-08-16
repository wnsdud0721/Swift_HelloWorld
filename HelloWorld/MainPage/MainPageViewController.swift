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

        mainPageTableView.delegate = self
        mainPageTableView.dataSource = self
        
        mainPageTableView.separatorStyle = .none
        
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        mainPageTableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
    }

}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let feedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        //feedTableViewCell.selectionStyle = .none
        return feedTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540
    }
    
    
}
