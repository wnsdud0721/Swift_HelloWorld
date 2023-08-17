//
//  TestViewController.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/17.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
