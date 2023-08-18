//
//  DetailPageViewController.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import UIKit

class DetailPageViewController: UIViewController {
    

    
    var likeButtonBool = false
    
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userImage: UIButton!
    
    @IBOutlet weak var feedImage: UIImageView!

    @IBOutlet weak var commentButton: UIButton!
  
    @IBOutlet weak var feedContent: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    @IBAction func likeButton(_ sender: Any) {
        if (likeButtonBool == false) {
            
            likeButtonBool = true
        }else{
            likeButtonBool = false
        }
       self .viewDidLoad()
    }
    
    @IBOutlet weak var likeButtonRef: UIButton!
    
    
    @IBOutlet weak var commentTextFeild: UITextView!
    
    
    @IBAction func commentDonButton(_ sender: Any) {
        if (commentTextFeild.text == "") {

        }else
        {
            userInfoData[dataIndex[0]].myFeedList[dataIndex[1]].commentIndex.append(comment (commentContent : "\(commentTextFeild.text!)", userName : "\(userInfoData[dataIndex[0]].userName)"))
        }
        commentTextFeild.text = ""

        // 블로깅 해보기 화면 터치 시 키보드 내리기

        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        self.commentTextFeild.resignFirstResponder()
    }
  
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        feedContent.text = "\(userInfoData[dataIndex[0]].myFeedList[dataIndex[1]].content)"
        feedContent.sizeThatFits(view.frame.size)
        userName.text = userInfoData[dataIndex[0]].userName
        commentTextFeild.layer.borderWidth = 1.0
        commentTextFeild.layer.cornerRadius = 5
        
        // 라이크 버튼 핸들링
        if (likeButtonBool == false) {
            likeButtonRef.backgroundColor = .blue
        }else{
            likeButtonRef.backgroundColor = .red
        }
        
        // 화면 터치 시 키보드 내리기
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
        super.viewDidLoad()

    }
   
}

class ContentWrappingTableView: UITableView{

    override var intrinsicContentSize: CGSize {
        return self.contentSize
      }

      override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
            
        }
      }
}



extension DetailPageViewController :UITableViewDelegate, UITableViewDataSource{
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return userInfoData[dataIndex[0]].myFeedList[dataIndex[1]].commentIndex.count
       }
   

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let index = indexPath.row
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as! CustomTableViewCell
    
        
            cell.userNameCell.text  = userInfoData[dataIndex[0]].myFeedList[dataIndex[1]].commentIndex[index].userName
            cell.commentCell.text  = userInfoData[dataIndex[0]].myFeedList[dataIndex[1]].commentIndex[index].commentContent
        cell.commentCell.sizeToFit()
        cell.userNameCell.sizeToFit()
    
            return cell
    }
    
}





extension DetailPageViewController : UITextViewDelegate {
 
    func textViewDidChange(_ textView: UITextView) {
        if commentTextFeild.text.count > 30 {
            return commentTextFeild.deleteBackward()
        }
        // 텍스트 뷰 터치 시 키보드 올리기
        self.commentTextFeild.becomeFirstResponder()
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
