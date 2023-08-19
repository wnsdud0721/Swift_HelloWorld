//
//  ViewController.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/14.
//

import Photos
import UIKit

protocol FeedDataDelegate: AnyObject {
    func didSubmitData(image: UIImage, title: String, content: String)
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var selectImageButton: UIButton!
    @IBOutlet var titleTextView: UITextView!
    @IBOutlet var contentTextView: UITextView!
    weak var delegate: FeedDataDelegate?
    
    @IBAction func backMainPage(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        titleTextView.text = "제목을 입력하세요."
        contentTextView.text = "내용을 입력하세요."
        
        titleTextView.delegate = self
        contentTextView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        titleTextView.resignFirstResponder()
        contentTextView.resignFirstResponder()
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            showImagePicker()
        case .denied, .restricted:
            
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        self.showImagePicker()
                    }
                    
                default:
                    break
                }
            }
        default:
            break
        }
    }
    
    func showImagePicker() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonTab(_ sender: UIBarButtonItem) {
        feedCount += 1
        // 이미지,타이틀텍스트,콘텐트텍스트 입력시 얻어오기
        guard let image = imageView.image,
              let title = titleTextView.text,
              title != "제목을 입력하세요.",
              let content = contentTextView.text,
              content != "내용을 입력하세요."
        else {
            showAlert(message: "제목, 내용 및 이미지를 모두 입력해주세요.")
            return
        }
        //새로운feed객체생성&유저디폴트 사용자이름 가져와 해당 사용자에게 피드 추가

        let newFeed = feedList(title: "\(titleTextView.text!)", content: "\(contentTextView.text!)", feedImageName: "사진", commentIndex: [comment(commentContent: "댓글", userName: "김미영", userImage: "김미영 사진")], userProfile: "사진", userName: userInfoData[0].userName)
        
   
        appendFeedToUser(userName: userInfoData[0].userName, newFeed: newFeed)
        
        
//        guard let convertedFeed = convertFeedToFeedList(feed: newFeed) else {
//            print("Failed to convert feed to feedList!")
//            return
//        }
        
        
        
        
        
        
        saveDataToUserDefaults(image: image, title: title, content: content)
        delegate?.didSubmitData(image: image, title: title, content: content)
        if delegate == nil {
            print("Delegate is not set!")
        } else {
            delegate?.didSubmitData(image: image, title: title, content: content)
        }
        resetInputFields()
        self.presentingViewController?.dismiss(animated: true)
        

    }
    
     //이미지 저장&해당파일 가져옴
//    func convertFeedToFeedList(feed: feedList ) -> feedList? {
//        guard saveImageAndGetFilename(image: UIImage(named: feed.feedImageName)!) != nil else {
//            return nil
//        }
//
//
//        return feedList(title: feed.title, content: feed.content, feedImageName: feed.feedImageName, commentIndex: [] , userProfile: userInfoData[0].profileImageName, userName: userInfoData[0].userName)
//    }

    // 이미지 저장&파일이름 반환
    func saveImageAndGetFilename(image: UIImage) -> String? {
        if let data = image.jpegData(compressionQuality: 1.0),
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let filename = path.appendingPathComponent(UUID().uuidString + ".jpg")
            try? data.write(to: filename)
            return filename.lastPathComponent
        }
        return nil
    }

    func appendFeedToUser(userName: String, newFeed: feedList) {
//        guard let convertedFeed = convertFeedToFeedList(feed: newFeed) else {
//            print("Failed to convert feed to feedList!")
//            return
//        }
        userInfoData[0].myFeedList.insert(newFeed, at: 0)
        
//        if let index =
//            userInfoData.firstIndex(where: { $0.userName == userName }) {
            
//            print("New feed added to \(userName)'s feed list!")
//        } else {
//            print("\(userName) not found in userInfoData!")
//        }
    }

    func saveDataToUserDefaults(image: UIImage, title: String, content: String) {
        if let data = image.jpegData(compressionQuality: 1.0),
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let filename = path.appendingPathComponent("\(title).jpg")
            try? data.write(to: filename)
            
            UserDefaults.standard.set(filename.path, forKey: "ImagePath")
        }
        UserDefaults.standard.set(title, forKey: "Title")
        UserDefaults.standard.set(content, forKey: "Content")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func resetInputFields() {
        titleTextView.text = "제목을 입력하세요."
        contentTextView.text = "내용을 입력하세요."
        imageView.image = nil
    }
}
    
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == titleTextView && textView.text == "제목을 입력하세요." {
            textView.text = ""
        } else if textView == contentTextView && textView.text == "내용을 입력하세요." {
            textView.text = ""
        }
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == titleTextView && textView.text.trimmingCharacters(in: .whitespaces).isEmpty {
            textView.text = "제목을 입력하세요."
        } else if textView == contentTextView && textView.text.trimmingCharacters(in: .whitespaces).isEmpty {
            textView.text = "내용을 입력하세요."
        }
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if titleTextView.frame.contains(touch.location(in: view)) || contentTextView.frame.contains(touch.location(in: view)) {
            return false
        }
        return true
    }
}
