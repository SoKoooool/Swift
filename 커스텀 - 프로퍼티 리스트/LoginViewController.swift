//
//  LoginViewController.swift
//  MyApps
//
//  Created by TORI on 2020/10/08.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let id = UITextField()
    let pw = UITextField()
    let loginBtn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .systemBackground
        self.id.delegate = self
        self.pw.delegate = self
        self.setup()
        
        
        
    }
    
    func setup() {
        // 계정 생성
        let signUp = UIBarButtonItem(title: "계정 생성", style: .done, target: self, action: #selector(profileEdit))
        self.navigationItem.rightBarButtonItem = signUp
        if self.traitCollection.userInterfaceStyle == .light {
            signUp.tintColor = .black
        } else {
            signUp.tintColor = .white
        }
        
        // 로고
        let logo = UIImageView()
        if traitCollection.userInterfaceStyle == .light {
            logo.image = UIImage(named: "instagram.logo.font")?.withTintColor(.black)
        } else {
            logo.image = UIImage(named: "instagram.logo.font")?.withTintColor(.white)
        }
        self.view.addSubview(logo)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 60).isActive = true
        logo.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        // 로그인 텍스트필드
        self.id.font = UIFont.systemFont(ofSize: 14)
        self.id.placeholder = "전화번호, 사용자 이름 또는 이메일"
        self.id.textAlignment = .left
        self.id.autocorrectionType = .no
        self.id.autocapitalizationType = .none
        self.id.smartDashesType = .no
        self.id.smartQuotesType = .no
        self.id.spellCheckingType = .no
        self.id.clearButtonMode = .whileEditing
        self.id.borderStyle = .roundedRect
        
        self.pw.font = UIFont.systemFont(ofSize: 14)
        self.pw.placeholder = "비밀번호"
        self.pw.textAlignment = .left
        self.pw.autocorrectionType = .no
        self.pw.autocapitalizationType = .none
        self.pw.smartDashesType = .no
        self.pw.smartQuotesType = .no
        self.pw.spellCheckingType = .no
        self.pw.clearButtonMode = .whileEditing
        self.pw.borderStyle = .roundedRect
        self.pw.isSecureTextEntry = true
        
        if traitCollection.userInterfaceStyle == .light {
            self.id.backgroundColor = .systemGray6
            self.pw.backgroundColor = .systemGray6
        } else {
            self.id.backgroundColor = UIColor(displayP3Red: 20/255, green: 20/255, blue: 20/255, alpha: 0.8)
            self.pw.backgroundColor = UIColor(displayP3Red: 20/255, green: 20/255, blue: 20/255, alpha: 0.8)
        }
        
        self.view.addSubview(self.id)
        self.view.addSubview(self.pw)
        
        self.id.translatesAutoresizingMaskIntoConstraints = false
        self.id.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
        self.id.topAnchor.constraint(equalTo: logo.layoutMarginsGuide.bottomAnchor, constant: 40).isActive = true
        self.id.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.id.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        self.id.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        self.pw.translatesAutoresizingMaskIntoConstraints = false
        self.pw.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
        self.pw.topAnchor.constraint(equalTo: self.id.layoutMarginsGuide.bottomAnchor, constant: 20).isActive = true
        self.pw.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.pw.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        self.pw.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        // 비밀번호 찾기
        let searchPw = UIButton(type: .system)
        searchPw.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        searchPw.setTitle("비밀번호를 잊으셨나요 ?", for: .normal)
        self.view.addSubview(searchPw)
        
        searchPw.translatesAutoresizingMaskIntoConstraints = false
        searchPw.topAnchor.constraint(equalTo: self.pw.layoutMarginsGuide.bottomAnchor, constant: 20).isActive = true
        searchPw.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        // 로그인 버튼
        self.loginBtn.setTitle("로그인", for: .normal)
        self.loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.loginBtn.backgroundColor = .systemRed
        self.loginBtn.tintColor = .white
        self.loginBtn.layer.cornerRadius = 5
        self.loginBtn.layer.masksToBounds = true
        self.view.addSubview(self.loginBtn)

        self.loginBtn.translatesAutoresizingMaskIntoConstraints = false
        self.loginBtn.heightAnchor.constraint(equalToConstant: 43.5).isActive = true
        self.loginBtn.topAnchor.constraint(equalTo: searchPw.layoutMarginsGuide.bottomAnchor, constant: 30).isActive = true
        self.loginBtn.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.loginBtn.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        let or = UILabel()
        or.font = UIFont.systemFont(ofSize: 12)
        or.text = "또는"
        self.view.addSubview(or)
        
        or.translatesAutoresizingMaskIntoConstraints = false
        or.topAnchor.constraint(equalTo: self.loginBtn.layoutMarginsGuide.bottomAnchor, constant: 30).isActive = true
        or.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        let facebook = UIButton(type: .system)
        facebook.setImage(UIImage(named: "facebook.icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        facebook.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        facebook.setTitle(" 페이스북(으)로 로그인", for: .normal)
        facebook.semanticContentAttribute = .forceLeftToRight
        self.view.addSubview(facebook)
        
        facebook.translatesAutoresizingMaskIntoConstraints = false
        facebook.topAnchor.constraint(equalTo: or.layoutMarginsGuide.bottomAnchor, constant: 30).isActive = true
        facebook.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.id.resignFirstResponder()
        self.pw.resignFirstResponder()
    }
    
    @objc func login() {
        let customPlist = "\(self.id.text!).plist"
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = paths[0] as NSString
        let clist = path.strings(byAppendingPaths: [customPlist]).first!
        let data = NSDictionary(contentsOfFile: clist)
        
        if self.id.text == data?["id"] as? String, self.pw.text == data?["pw"] as? String {
            let ud = UserDefaults.standard
            ud.setValue(self.id.text!, forKey: "id")
            
            let vc = HomeTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if self.id.text == "" {
            let alert = UIAlertController(title: "아이디가 입력되지 않았습니다", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: true)
        } else if self.pw.text == "" {
            let alert = UIAlertController(title: "비밀번호가 입력되지 않았습니다", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "로그인 실패", message: "아이디와 비밀번호를 확인해주세요", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: true)
        }
    }
    
    @objc func profileEdit() {
        let vc = JoinFormViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        #warning("텍스트필드 글자수에 따라 로그인 버튼이 활성/비활성 기능 구현하고 싶음")
        if (self.id.text?.count)! + string.count - range.length > 3 && (self.pw.text?.count)! + string.count - range.length > 3 {
            self.loginBtn.backgroundColor = .systemBlue
        } else {
            self.loginBtn.backgroundColor = .systemRed
        }
        return true
    }
}
