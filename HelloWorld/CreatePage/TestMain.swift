//
//  TestMain.swift
//  HelloWorld
//
//  Created by 김도윤 on 2023/08/17.
//

import Foundation
import UIKit
class FeedViewController: UIViewController, FeedDataDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var delegate: FeedDataDelegate?
    // ... 다른 코드들 ...

    func didSubmitData(image: UIImage, title: String, content: String) {
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "yourSegueIdentifier", let uploadVC = segue.destination as? ViewController {
            uploadVC.delegate = self
        }
    }
}
// 어디선가 (예를 들면 prepareForSegue에서) FeedViewController가 생성되거나 접근될 때:
//let feedVC = FeedViewController() // 예시 코드, 실제로는 다를 수 있습니다.
//let uploadVC = ViewController() // 이것도 예시 코드입니다.
//uploadVC.delegate = feedVC
