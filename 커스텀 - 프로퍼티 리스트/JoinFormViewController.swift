//
//  JoinFormViewController.swift
//  MyApps
//
//  Created by TORI on 2020/10/05.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class JoinFormViewController: UIViewController {
    let acountImage = UIImageView()
    let acountForm = UITableView()
    
    let inputId = UITextField()
    let inputPw = UITextField()
    let inputName = UITextField()
    let inputIntro = UITextField()
    let inputEmail = UITextField()
    let inputNumber = UITextField()
    let inputGender = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.title = "프로필 편집"
        self.setup()
    }
    
    func setup() {
        // 완료 버튼
        let done = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveToProfile))
        self.navigationItem.rightBarButtonItem = done
        
        // 프로필 이미지
        let img = UIImage(named: "profile.default")
        self.acountImage.image = img
        self.acountImage.layer.cornerRadius = 60
        self.acountImage.layer.masksToBounds = true
        self.view.addSubview(self.acountImage)
        
        self.acountImage.translatesAutoresizingMaskIntoConstraints = false
        self.acountImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.acountImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.acountImage.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        self.acountImage.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        // 프로필 편집 테이블뷰
        self.acountForm.delegate = self
        self.acountForm.dataSource = self
        self.acountForm.isScrollEnabled = false
        self.view.addSubview(self.acountForm)
        
        self.acountForm.translatesAutoresizingMaskIntoConstraints = false
        self.acountForm.heightAnchor.constraint(equalToConstant: 44 * 10).isActive = true
        self.acountForm.topAnchor.constraint(equalTo: self.acountImage.layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
        self.acountForm.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.acountForm.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    @objc func saveToProfile() {
        if self.inputId.text?.isEmpty == true {
            let alert = UIAlertController(title: "아이디가 입력되지 않았습니다", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        } else if self.inputId.text == "" {
            // 띄어쓰기 감지 구현 예정
        } else if self.inputPw.text?.isEmpty == true {
            let alert = UIAlertController(title: "비밀번호가 입력되지 않았습니다", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        } else if self.inputPw.text == "" {
            // 띄어쓰기 감지 구현 예정
        } else {
            // 커스텀 프로퍼티 리스트
            let customPlist = "\(self.inputId.text!).plist"
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let path = paths[0] as NSString
            let plist = path.strings(byAppendingPaths: [customPlist]).first!
            let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
            
            let img = self.acountImage.image
            let jpgImage = img!.jpegData(compressionQuality: 0.1)
            data.setValue(jpgImage, forKey: "img")
            data.setValue(self.inputId.text, forKey: "id")
            data.setValue(self.inputPw.text, forKey: "pw")
            data.setValue(self.inputName.text, forKey: "name")
            data.setValue(self.inputIntro.text, forKey: "intro")
            data.setValue(self.inputEmail.text, forKey: "email")
            data.setValue(self.inputNumber.text, forKey: "number")
            data.setValue(self.inputGender.text, forKey: "gender")
            data.write(toFile: plist, atomically: true)
            
            self.navigationController?.popViewController(animated: true)
        }
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
        let photo = UIAlertAction(title: "포토 라이브러리", style: .default) { (_) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true)
        }
        
        pickType.addAction(cancel)
        pickType.addAction(camera)
        pickType.addAction(photo)
        self.present(pickType, animated: true)
    }
}

// MARK: - 회원 이미지 피커 컨트롤러

extension JoinFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지를 선택했을때
        self.dismiss(animated: true) { () in // (_) 아님 주의!!
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.acountImage.image = img
        }
    }
}

// MARK: - 회원가입 테이블뷰

extension JoinFormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ListCell")
        cell.selectionStyle = .none
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16)
        cell.contentView.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.widthAnchor.constraint(equalToConstant: 100).isActive = true
        title.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        
        switch indexPath.row {
        case 0:
            cell.separatorInset.left = 0
            
            let editImg = UIButton(type: .system)
            editImg.setTitle("프로필 사진 설정하기", for: .normal)
            editImg.addTarget(self, action: #selector(imgPick), for: .touchUpInside)
            cell.contentView.addSubview(editImg)
            
            editImg.translatesAutoresizingMaskIntoConstraints = false
            editImg.centerXAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerXAnchor).isActive = true
            editImg.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 1:
            cell.separatorInset.left = 120
            title.text = "아이디"
            
            self.inputId.clearButtonMode = .whileEditing
            self.inputId.textAlignment = .left
            self.inputId.placeholder = "아이디"
            self.inputId.autocorrectionType = .no
            self.inputId.autocapitalizationType = .none
            self.inputId.smartDashesType = .no
            self.inputId.smartQuotesType = .no
            self.inputId.spellCheckingType = .no
            self.inputId.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputId)
            
            self.inputId.translatesAutoresizingMaskIntoConstraints = false
            self.inputId.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputId.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputId.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputId.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 2:
            cell.separatorInset.left = 120
            title.text = "비밀번호"
            
            self.inputPw.clearButtonMode = .whileEditing
            self.inputPw.isSecureTextEntry = true
            self.inputPw.textAlignment = .left
            self.inputPw.placeholder = "비밀번호"
            self.inputPw.autocorrectionType = .no
            self.inputPw.autocapitalizationType = .none
            self.inputPw.smartDashesType = .no
            self.inputPw.smartQuotesType = .no
            self.inputPw.spellCheckingType = .no
            self.inputPw.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputPw)
            
            self.inputPw.translatesAutoresizingMaskIntoConstraints = false
            self.inputPw.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputPw.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputPw.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputPw.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 3:
            cell.separatorInset.left = 120
            title.text = "이름"
            
            self.inputName.clearButtonMode = .whileEditing
            self.inputName.textAlignment = .left
            self.inputName.placeholder = "이름"
            self.inputName.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputName)
            
            self.inputName.translatesAutoresizingMaskIntoConstraints = false
            self.inputName.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputName.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputName.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputName.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 4:
            cell.separatorInset.left = 0
            title.text = "소개"
            
            self.inputIntro.clearButtonMode = .whileEditing
            self.inputIntro.textAlignment = .left
            self.inputIntro.placeholder = "소개"
            self.inputIntro.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputIntro)
            
            self.inputIntro.translatesAutoresizingMaskIntoConstraints = false
            self.inputIntro.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputIntro.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputIntro.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputIntro.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 5:
            cell.separatorInset.left = 0
            
            let proAcount = UIButton(type: .system)
            proAcount.setTitle("프로페셔널 계정으로 전환", for: .normal)
            proAcount.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(proAcount)
            
            proAcount.translatesAutoresizingMaskIntoConstraints = false
            proAcount.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
            proAcount.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
        case 6:
            cell.separatorInset.left = 500
            title.text = "개인 정보"
        case 7:
            cell.separatorInset.left = 120
            title.text = "이메일"
            
            self.inputEmail.clearButtonMode = .whileEditing
            self.inputEmail.textAlignment = .left
            self.inputEmail.placeholder = "이메일"
            self.inputEmail.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputEmail)
            
            self.inputEmail.translatesAutoresizingMaskIntoConstraints = false
            self.inputEmail.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputEmail.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputEmail.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputEmail.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 8:
            cell.separatorInset.left = 120
            title.text = "전화"
            
            self.inputNumber.clearButtonMode = .whileEditing
            self.inputNumber.textAlignment = .left
            self.inputNumber.placeholder = "전화"
            self.inputNumber.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputNumber)
            
            self.inputNumber.translatesAutoresizingMaskIntoConstraints = false
            self.inputNumber.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputNumber.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputNumber.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputNumber.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        case 9:
            cell.separatorInset.left = 120
            title.text = "성별"
            
            self.inputGender.clearButtonMode = .whileEditing
            self.inputGender.textAlignment = .left
            self.inputGender.placeholder = "성별"
            self.inputGender.font = UIFont.systemFont(ofSize: 16)
            cell.contentView.addSubview(self.inputGender)
            
            self.inputGender.translatesAutoresizingMaskIntoConstraints = false
            self.inputGender.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
            self.inputGender.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
            self.inputGender.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            self.inputGender.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        default:
            break
        }
        return cell
    }
}
