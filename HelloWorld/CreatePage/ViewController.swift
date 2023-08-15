//
//  ViewController.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/14.
//

import Photos
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var selectImageButton: UIButton!
    @IBOutlet var titleTextView: UITextView!
    @IBOutlet var contentTextView: UITextView!

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        titleTextView.text = "제목을 입력하세요."
        contentTextView.text = "내용을 입력하세요."

        titleTextView.delegate = self
        contentTextView.delegate = self
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

    @IBAction func sharedButtonTapped(_ sender: UIBarButtonItem) {
        var itemsToShare: [Any] = []

        if let image = imageView.image {
            itemsToShare.append(image)
        }

        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)

        present(activityViewController, animated: true, completion: nil)
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
