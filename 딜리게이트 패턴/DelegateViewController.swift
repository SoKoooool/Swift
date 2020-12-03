//
//  DelegateViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {
    @IBOutlet var tfText: UILabel!
    @IBOutlet var tf: UITextField!
    @IBOutlet var tfLockText: UILabel!
    @IBOutlet var tfLock: UISwitch!
    @IBOutlet var imgv: UIImageView!
    
    @IBAction func tfLock(_ sender: UISwitch) {
        if sender.isOn == true {
            self.tfLockText.text = "잠김"
            self.tf.text = ""
            self.tf.resignFirstResponder()
        } else {
            self.tfLockText.text = "해제"
            self.tf.becomeFirstResponder()
        }
    }
    
    @IBAction func imgPick(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.modalPresentationStyle = .fullScreen
        
        let pickType = UIAlertController(title: nil, message: "이미지 선택", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let camera = UIAlertAction(title: "카메라", style: .default) { (_) in
            picker.sourceType = .camera
            self.present(picker, animated: true)
        }
        let photo = UIAlertAction(title: "포토 라이브러리", style: .default) { (_) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true)
        }
        pickType.addAction(cancel)
        pickType.addAction(camera)
        pickType.addAction(photo)
        self.present(pickType, animated: true)
    }
    
    @objc func textFieldDidEndEditing() {
        // 화면 터치시 텍스트필드 입력 종료
        self.tf.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tf.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(textFieldDidEndEditing))
        self.view.addGestureRecognizer(tap)
    }
}

// MARK: - 텍스트필드 설정

extension DelegateViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // 텍스트필드의 입력이 시작될때
        if self.tfLock.isOn == true {
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 텍스트필드의 리턴키를 눌렀을때
        if tf.text?.isEmpty == true {
            self.tfText.text = "텍스트필드 입력 내용"
            self.tf.text = ""
        } else {
            self.tfText.text = self.tf.text
            self.tf.text = ""
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 텍스트필드의 내용이 편집중일때
        if (tf.text?.count)! > 30 {
            return false
        } else {
            return true
        }
    }
}

// MARK: - 이미지피커 설정
extension DelegateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 선택이 취소되었을때
        self.dismiss(animated: true) { () in // (_) 아님 주의!!
            let alert = UIAlertController(title: nil, message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지를 선택했을때
        self.dismiss(animated: true) { () in // (_) 아님 주의!!
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgv.image = img
            self.imgv.layer.cornerRadius = self.imgv.frame.size.width / 2
            self.imgv.layer.masksToBounds = true
        }
    }
}
