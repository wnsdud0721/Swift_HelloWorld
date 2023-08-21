//
//  EditMyPageViewController.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import UIKit
import Photos

class EditMyPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var editMyField: UITextField!

    @IBOutlet weak var editMyFieldInfo: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    var isImageChanged = false
    
    @IBAction func selectedMyImage(_ sender: Any) {
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
            b = editedImage
            myImage.image = editedImage
            isImageChanged = true
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImage.image = originalImage
        }
        dismiss(animated: true, completion: nil)
        
        print(myImage as Any)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
//    editMyFieldInfo
    @IBAction func editCompleButton(_ sender: Any) {
        
        if editMyField.text?.isEmpty == false, editMyFieldInfo.text.isEmpty == false, isImageChanged {
            userInfoData[0].userName = "\(editMyField.text!)"
            userInfoData[0].info = "\(editMyFieldInfo.text!)"
            userInfoData[0].profileImageName = b
        }
        
        else {
            showAlert(message: "이름, 소개 및 이미지를 모두 입력해주세요.")
            return
        }
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func editCancelButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        // 사진 원형
        editMyFieldInfo.layer.borderWidth = 1.0
        editMyFieldInfo.layer.cornerRadius = 5
        
        // 키보드 관련
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
    }
    
    func saveImageAndGetFilename(image: UIImage) -> String? {
        if let data = image.jpegData(compressionQuality: 1.0),
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let filename = path.appendingPathComponent(UUID().uuidString + ".jpg")
            try? data.write(to: filename)
//            filename.lastPathComponent
   
            return filename.lastPathComponent
        }
        return nil
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
