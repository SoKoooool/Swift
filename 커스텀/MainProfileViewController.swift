//
//  MainProfileViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/01.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class MainProfileViewController: UIViewController {
    let profileImage = UIImageView()
    let profileForm = UITableView()
    let inputName = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.title = "메인 프로필 편집"
        self.setup()
    }
    
    func setup() {
        // 완료 버튼
        let done = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveToProfile))
        self.navigationItem.rightBarButtonItem = done
        
        // 프로필 이미지 설정
        let ud = UserDefaults.standard
        if ud.object(forKey: "MainProfileImage") == nil {
            profileImage.image = UIImage(named: "profile.default")
        } else {
            if let imgData = ud.object(forKey: "MainProfileImage") as? NSData {
                if let img = UIImage(data: imgData as Data) {
                    profileImage.image = img
                }
            }
        }
        self.profileImage.layer.cornerRadius = 60
        self.profileImage.layer.masksToBounds = true
        self.view.addSubview(self.profileImage)
        
        self.profileImage.translatesAutoresizingMaskIntoConstraints = false
        self.profileImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.profileImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.profileImage.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        self.profileImage.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        // 프로필 테이블뷰 설정
        self.profileForm.delegate = self
        self.profileForm.dataSource = self
        self.profileForm.isScrollEnabled = false
        self.view.addSubview(self.profileForm)
        
        self.profileForm.translatesAutoresizingMaskIntoConstraints = false
        self.profileForm.heightAnchor.constraint(equalToConstant: 43.5 * 3).isActive = true
        self.profileForm.topAnchor.constraint(equalTo: self.profileImage.layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
        self.profileForm.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.profileForm.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.inputName.resignFirstResponder()
    }
    
    @objc func saveToProfile() {
        let ud = UserDefaults.standard
        ud.setValue(self.inputName.text, forKey: "name")

        let img = self.profileImage.image
        let jpgImage = img!.jpegData(compressionQuality: 0.1)
        ud.set(jpgImage, forKey: "MainProfileImage")
        ud.synchronize()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func imgPick() {
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
        let photo = UIAlertAction(title: "저장된 앨범", style: .default) { (_) in
            picker.sourceType = .savedPhotosAlbum
            self.present(picker, animated: true)
        }
        
        pickType.addAction(cancel)
        pickType.addAction(camera)
        pickType.addAction(photo)
        self.present(pickType, animated: true)
    }
    
    @objc func removeProfile() {
        self.inputName.resignFirstResponder()
        self.profileImage.image = UIImage(named: "profile.default")
        self.inputName.text = ""
    }
}

// MARK: - 프로필 내용 테이블뷰

extension MainProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ListCell")
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            cell.separatorInset.left = 500
            
            let editImg = UIButton(type: .system)
            editImg.setTitle("프로필 사진 바꾸기", for: .normal)
            editImg.addTarget(self, action: #selector(imgPick), for: .touchUpInside)
            cell.contentView.addSubview(editImg)
            
            editImg.translatesAutoresizingMaskIntoConstraints = false
            editImg.centerXAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerXAnchor).isActive = true
            editImg.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 1:
            cell.separatorInset.left = 500
            
            let nameTitle = UILabel()
            nameTitle.text = "이름"
            cell.contentView.addSubview(nameTitle)
            
            let ud = UserDefaults.standard
            self.inputName.delegate = self
            self.inputName.clearButtonMode = .whileEditing
            self.inputName.text = ud.string(forKey: "name")
            self.inputName.placeholder = "이름을 입력해주세요"
            self.inputName.textAlignment = .right
            self.inputName.borderStyle = .none
            cell.contentView.addSubview(self.inputName)
            
            nameTitle.translatesAutoresizingMaskIntoConstraints = false
            nameTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
            nameTitle.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
            nameTitle.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
            
            self.inputName.translatesAutoresizingMaskIntoConstraints = false
            self.inputName.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputName.leadingAnchor.constraint(equalTo: nameTitle.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputName.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
        case 2:
            let remove = UIButton(type: .system)
            remove.setTitle("삭제", for: .normal)
            remove.addTarget(self, action: #selector(removeProfile), for: .touchUpInside)
            cell.contentView.addSubview(remove)
            
            remove.translatesAutoresizingMaskIntoConstraints = false
            remove.centerXAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerXAnchor).isActive = true
            remove.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        default:
            break
        }
        return cell
    }
}

// MARK: - 회원 이미지 피커 컨트롤러

extension MainProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
            self.profileImage.image = img
        }
    }
}

// MARK: - 프로필 텍스트필드 설정

extension MainProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.inputName.resignFirstResponder()
    }
}
