//
//  EditMyPageViewController.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import UIKit

class EditMyPageViewController: UIViewController {
    
    @IBOutlet weak var editMyField: UITextField!

    @IBOutlet weak var editMyFieldInfo: UITextView!
    
//    editMyFieldInfo
    @IBAction func editCompleButton(_ sender: Any) {
        userInfoData[0].userName = "\(editMyField.text!)"
        userInfoData[0].info = "\(editMyFieldInfo.text!)"
        self.presentingViewController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        editMyFieldInfo.layer.borderWidth = 1.0
        editMyFieldInfo.layer.cornerRadius = 5
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
    }
    
    
}
extension EditMyPageViewController : UITextViewDelegate {
 
    func textViewDidChange(_ textView: UITextView) {
        if editMyFieldInfo.text.count > 30 {
            return editMyFieldInfo.deleteBackward()
        }
    }
    
    // 키보드 올라올 시 뷰 올리기 분석
    override func viewWillAppear(_ animated: Bool) {
        // 옵져버를 등록
        // 옵저버 대상 self
        // 옵져버 감지시 실행 함수
        // 옵져버가 감지할 것
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
           let keyboardRectangle = keyboardFrame.cgRectValue
       
            UIView.animate(
                withDuration: 0.3
                , animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
                }
            )
        }
    }
    
    @objc func keyboardDown() {
        self.view.transform = .identity
    }
}
