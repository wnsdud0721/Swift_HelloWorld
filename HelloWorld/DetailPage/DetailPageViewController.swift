//
//  DetailPageViewController.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import UIKit

class DetailPageViewController: UIViewController {
    

    class userInfoList  {
        var userName : String
        var profileImageName :String
        var freind : Array<String>
        var info : String
        var myFeedList : [feedList]
        init(userName: String, profileImageName: String, freind: Array<String>, info: String, myFeedList: [feedList]) {
            self.userName = userName
            self.profileImageName = profileImageName
            self.freind = freind
            self.info = info
            self.myFeedList = myFeedList
        }
    }

    class feedList  {
        var title : String
        var content : String
        var feedImageName : String
        var commentIndex : [comment]
        init(title: String, content: String, feedImageName: String, commentIndex: [comment]) {
            self.title = title
            self.content = content
            self.feedImageName = feedImageName
            self.commentIndex = commentIndex
        }
    }

    class comment  {
        var commentContent : String
        var userName : String
        init(commentContent: String, userName: String) {
            self.commentContent = commentContent
            self.userName = userName
        }
    }


    var userInfoData : [userInfoList] = [userInfoList(userName : "김민수", profileImageName: "Desktop/갤러리/사진.jpg", freind: ["김영미"], info: "개발자가 되고 싶은 김민수 입니다.", myFeedList: [feedList(title : "맛있는 하루", content: "대충 맛있는 곳asdfasdfasdfasdfasdfasdfasdf대충 맛있는  곳asdfasdfasdfasdfasdfasdfasdf대충 맛있는 곳asdfasdfasdfasdfasdfasdfasdf대충 맛있는 곳asdfasdfasdfasdfasdfasdfasdf", feedImageName: "사진", commentIndex : [comment( commentContent: "댓글1", userName: "김민수")]),feedList(title : "맛있는 이틀", content: "그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳그런곳", feedImageName: "사진", commentIndex : [comment( commentContent: "댓글1", userName: "김민수"),comment( commentContent: "댓글길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게길게2", userName: "김민수"),comment( commentContent: "댓글3", userName: "김영미"),comment( commentContent: "댓글4", userName: "김영미")])]),userInfoList(userName : "김영미", profileImageName: "사진", freind: ["김민수"], info: "아 ㅋㅋ 쉬고싶다", myFeedList: [feedList(title : "영미야!!", content: "오늘 쉬는날", feedImageName: "사진", commentIndex : [comment( commentContent: "댓글1", userName: "김민수")]),feedList(title : "내일도 쉬는날", content: "좋다!", feedImageName: "사진", commentIndex : [comment( commentContent: "댓글1", userName: "김민수")])])]

    var dataIndex = [0,1]
    
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
    
    
    @IBAction func commentDoneButton(_ sender: Any) {
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
