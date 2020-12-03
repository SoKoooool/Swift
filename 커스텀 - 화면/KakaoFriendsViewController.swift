//
//  KakaoFriendsViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/22.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class KakaoFriendsViewController: UIViewController {
    let menu = UIView()
    let colorView = UIScrollView()
    let eyeView = UIScrollView()
    let mouseView = UIScrollView()
    let eye = UIImageView()
    let mouse = UIImageView()
    
    // 상태바 숨기기인데 아이폰X 에서는 안먹힘
    var isStatusBarHidden = false
    override var prefersStatusBarHidden: Bool {
        return self.isStatusBarHidden
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .white
        self.bottomMenu()
        self.colorView.isHidden = true
        self.eyeView.isHidden = true
        self.mouseView.isHidden = true
        
        let hide = UITapGestureRecognizer(target: self, action: #selector(hideView))
        self.view.addGestureRecognizer(hide)
    }
    
    func bottomMenu() {
        // 하단 메뉴바
        self.view.addSubview(self.menu)
        
        self.menu.translatesAutoresizingMaskIntoConstraints = false
        self.menu.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.menu.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.menu.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.menu.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -40).isActive = true
        self.menu.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        let bg = UIButton(type: .custom)
        bg.setImage(UIImage(named: "menu.apeach"), for: .normal)
        bg.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
        
        let eye = UIButton(type: .custom)
        eye.setImage(UIImage(named: "menu.ryan")?.withRenderingMode(.alwaysOriginal), for: .normal)
        eye.addTarget(self, action: #selector(selectEye), for: .touchUpInside)
        
        let mouse = UIButton(type: .custom)
        mouse.setImage(UIImage(named: "menu.muzi")?.withRenderingMode(.alwaysOriginal), for: .normal)
        mouse.addTarget(self, action: #selector(selectMouse), for: .touchUpInside)
        
        self.menu.addSubview(bg)
        self.menu.addSubview(eye)
        self.menu.addSubview(mouse)
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bg.centerXAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.centerXAnchor, constant: -80).isActive = true
        bg.centerYAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.centerYAnchor).isActive = true
        
        eye.translatesAutoresizingMaskIntoConstraints = false
        eye.widthAnchor.constraint(equalToConstant: 40).isActive = true
        eye.heightAnchor.constraint(equalToConstant: 40).isActive = true
        eye.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        eye.centerYAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.centerYAnchor).isActive = true
        
        mouse.translatesAutoresizingMaskIntoConstraints = false
        mouse.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mouse.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mouse.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor, constant: 80).isActive = true
        mouse.centerYAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    @objc func selectColor(_ sender: UIButton) {
        // 배경 투명
        self.colorView.isHidden = false
        self.eyeView.isHidden = true
        self.mouseView.isHidden = true
        
        self.colorView.backgroundColor = .black
        self.colorView.alpha = 0.65
        self.colorView.layer.cornerRadius = 10
        self.colorView.layer.masksToBounds = true
        
        let bg = UIView()
        bg.backgroundColor = .clear
        
        self.view.addSubview(self.colorView)
        self.colorView.addSubview(bg)
        
        self.colorView.translatesAutoresizingMaskIntoConstraints = false
        self.colorView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.colorView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.colorView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        self.colorView.bottomAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bg.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        
        // 색상 목록
        let green = UIButton(type: .system)
        green.circleBtn()
        // green.backgroundColor = UIColor(displayP3Red: 40/255, green: 141/255, blue: 54/255, alpha: 1.0)
        green.backgroundColor = .systemGreen
        green.addTarget(self, action: #selector(setBgColor(_:)), for: .touchUpInside)
        
        let brown = UIButton(type: .system)
        brown.circleBtn()
        // brown.backgroundColor = UIColor(displayP3Red: 196/255, green: 130/255, blue: 31/255, alpha: 1.0)
        brown.backgroundColor = .brown
        brown.addTarget(self, action: #selector(setBgColor(_:)), for: .touchUpInside)
        
        let yellow = UIButton(type: .system)
        yellow.circleBtn()
        // yellow.backgroundColor = UIColor(displayP3Red: 254/255, green: 203/255, blue: 6/255, alpha: 1.0)
        yellow.backgroundColor = .systemYellow
        yellow.addTarget(self, action: #selector(setBgColor(_:)), for: .touchUpInside)
        
        let teal = UIButton(type: .system)
        teal.circleBtn()
        // teal.backgroundColor = UIColor(displayP3Red: 77/255, green: 129/255, blue: 170/255, alpha: 1.0)
        teal.backgroundColor = .systemTeal
        teal.addTarget(self, action: #selector(setBgColor(_:)), for: .touchUpInside)
        
        let pink = UIButton(type: .system)
        pink.circleBtn()
        pink.backgroundColor = UIColor(displayP3Red: 248/255, green: 186/255, blue: 195/255, alpha: 1.0)
        pink.addTarget(self, action: #selector(setBgColor(_:)), for: .touchUpInside)
        
        let white = UIButton(type: .system)
        white.circleBtn()
        white.backgroundColor = .white
        white.addTarget(self, action: #selector(setBgColor(_:)), for: .touchUpInside)
        
        bg.addSubview(green)
        bg.addSubview(brown)
        bg.addSubview(yellow)
        bg.addSubview(teal)
        bg.addSubview(pink)
        bg.addSubview(white)
        
        green.translatesAutoresizingMaskIntoConstraints = false
        green.widthAnchor.constraint(equalToConstant: 30).isActive = true
        green.heightAnchor.constraint(equalToConstant: 30).isActive = true
        green.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        green.leadingAnchor.constraint(equalTo: bg.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        
        brown.translatesAutoresizingMaskIntoConstraints = false
        brown.widthAnchor.constraint(equalToConstant: 30).isActive = true
        brown.heightAnchor.constraint(equalToConstant: 30).isActive = true
        brown.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        brown.leadingAnchor.constraint(equalTo: green.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        
        yellow.translatesAutoresizingMaskIntoConstraints = false
        yellow.widthAnchor.constraint(equalToConstant: 30).isActive = true
        yellow.heightAnchor.constraint(equalToConstant: 30).isActive = true
        yellow.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        yellow.leadingAnchor.constraint(equalTo: brown.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        
        teal.translatesAutoresizingMaskIntoConstraints = false
        teal.widthAnchor.constraint(equalToConstant: 30).isActive = true
        teal.heightAnchor.constraint(equalToConstant: 30).isActive = true
        teal.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        teal.leadingAnchor.constraint(equalTo: yellow.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        
        pink.translatesAutoresizingMaskIntoConstraints = false
        pink.widthAnchor.constraint(equalToConstant: 30).isActive = true
        pink.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pink.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        pink.leadingAnchor.constraint(equalTo: teal.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        
        white.translatesAutoresizingMaskIntoConstraints = false
        white.widthAnchor.constraint(equalToConstant: 30).isActive = true
        white.heightAnchor.constraint(equalToConstant: 30).isActive = true
        white.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        white.leadingAnchor.constraint(equalTo: pink.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
    }
    
    @objc func setBgColor(_ sender: UIButton) {
        // 선택한 색상을 배경색으로 변경
        self.view.backgroundColor = sender.backgroundColor
    }
    
    @objc func selectEye(_ sender: UIButton) {
        // 배경 투명
        self.eyeView.isHidden = false
        self.colorView.isHidden = true
        self.mouseView.isHidden = true
        
        self.eyeView.backgroundColor = .black
        self.eyeView.alpha = 0.65
        self.eyeView.layer.cornerRadius = 10
        self.eyeView.layer.masksToBounds = true
        
        let bg = UIView()
        bg.backgroundColor = .clear
        
        self.view.addSubview(self.eyeView)
        self.eyeView.addSubview(bg)
        
        self.eyeView.translatesAutoresizingMaskIntoConstraints = false
        self.eyeView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.eyeView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.eyeView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        self.eyeView.bottomAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bg.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        
        // 눈 모양 목록
        let ryan = UIButton(type: .custom)
        ryan.setImage(UIImage(named: "ryan.face.eye"), for: .normal)
        ryan.addTarget(self, action: #selector(setEye(_:)), for: .touchUpInside)
        ryan.circleBtn()
        ryan.tag = 0
        
        let muzi = UIButton(type: .custom)
        muzi.setImage(UIImage(named: "muzi.face.eye"), for: .normal)
        muzi.addTarget(self, action: #selector(setEye(_:)), for: .touchUpInside)
        muzi.circleBtn()
        muzi.tag = 1
        
        let apeach = UIButton(type: .custom)
        apeach.setImage(UIImage(named: "apeach.face.eye"), for: .normal)
        apeach.addTarget(self, action: #selector(setEye(_:)), for: .touchUpInside)
        apeach.circleBtn()
        apeach.tag = 2
        
        let tube = UIButton(type: .custom)
        tube.setImage(UIImage(named: "tube.face.eye"), for: .normal)
        tube.addTarget(self, action: #selector(setEye(_:)), for: .touchUpInside)
        tube.circleBtn()
        tube.tag = 3
        
        bg.addSubview(ryan)
        bg.addSubview(muzi)
        bg.addSubview(apeach)
        bg.addSubview(tube)
        
        ryan.translatesAutoresizingMaskIntoConstraints = false
        ryan.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ryan.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ryan.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        ryan.leadingAnchor.constraint(equalTo: bg.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        
        muzi.translatesAutoresizingMaskIntoConstraints = false
        muzi.widthAnchor.constraint(equalToConstant: 30).isActive = true
        muzi.heightAnchor.constraint(equalToConstant: 30).isActive = true
        muzi.leadingAnchor.constraint(equalTo: ryan.layoutMarginsGuide.leadingAnchor, constant: 35).isActive = true
        muzi.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        
        apeach.translatesAutoresizingMaskIntoConstraints = false
        apeach.widthAnchor.constraint(equalToConstant: 30).isActive = true
        apeach.heightAnchor.constraint(equalToConstant: 30).isActive = true
        apeach.leadingAnchor.constraint(equalTo: muzi.layoutMarginsGuide.leadingAnchor, constant: 35).isActive = true
        apeach.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        
        tube.translatesAutoresizingMaskIntoConstraints = false
        tube.widthAnchor.constraint(equalToConstant: 30).isActive = true
        tube.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tube.leadingAnchor.constraint(equalTo: apeach.layoutMarginsGuide.leadingAnchor, constant: 35).isActive = true
        tube.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    @objc func setEye(_ sender: UIButton) {
        // 선택한 눈 모양을 배경에 추가, 변경
        switch sender.tag {
        case 0:
            eye.image = UIImage(named: "ryan.eye")
        case 1:
            eye.image = UIImage(named: "muzi.eye")
        case 2:
            eye.image = UIImage(named: "apeach.eye")
        case 3:
            eye.image = UIImage(named: "tube.eye")
        default:
            break
        }
        self.view.addSubview(eye)
        
        eye.translatesAutoresizingMaskIntoConstraints = false
        eye.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        eye.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30).isActive = true
    }
    
    @objc func selectMouse(_ sender: UIButton) {
        // 배경 투명
        self.mouseView.isHidden = false
        self.colorView.isHidden = true
        self.eyeView.isHidden = true
        
        self.mouseView.backgroundColor = .black
        self.mouseView.alpha = 0.65
        self.mouseView.layer.cornerRadius = 10
        self.mouseView.layer.masksToBounds = true
        
        let bg = UIView()
        bg.backgroundColor = .clear
        
        self.view.addSubview(self.mouseView)
        self.mouseView.addSubview(bg)
        
        self.mouseView.translatesAutoresizingMaskIntoConstraints = false
        self.mouseView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.mouseView.bottomAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        self.mouseView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        self.mouseView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bg.bottomAnchor.constraint(equalTo: self.menu.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        bg.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        // 입 모양 목록
        let ryan = UIButton(type: .custom)
        ryan.setImage(UIImage(named: "ryan.face.mouse"), for: .normal)
        ryan.addTarget(self, action: #selector(setMouse(_:)), for: .touchUpInside)
        ryan.circleBtn()
        ryan.tag = 0
        
        let muzi = UIButton(type: .custom)
        muzi.setImage(UIImage(named: "muzi.face.mouse"), for: .normal)
        muzi.addTarget(self, action: #selector(setMouse(_:)), for: .touchUpInside)
        muzi.circleBtn()
        muzi.tag = 1
        
        let apeach = UIButton(type: .custom)
        apeach.setImage(UIImage(named: "apeach.face.mouse"), for: .normal)
        apeach.addTarget(self, action: #selector(setMouse(_:)), for: .touchUpInside)
        apeach.circleBtn()
        apeach.tag = 2
        
        let tube = UIButton(type: .custom)
        tube.setImage(UIImage(named: "tube.face.mouse"), for: .normal)
        tube.addTarget(self, action: #selector(setMouse(_:)), for: .touchUpInside)
        tube.circleBtn()
        tube.tag = 3
        
        bg.addSubview(ryan)
        bg.addSubview(muzi)
        bg.addSubview(apeach)
        bg.addSubview(tube)
        
        ryan.translatesAutoresizingMaskIntoConstraints = false
        ryan.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ryan.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ryan.leadingAnchor.constraint(equalTo: bg.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        ryan.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        
        muzi.translatesAutoresizingMaskIntoConstraints = false
        muzi.widthAnchor.constraint(equalToConstant: 30).isActive = true
        muzi.heightAnchor.constraint(equalToConstant: 30).isActive = true
        muzi.leadingAnchor.constraint(equalTo: ryan.layoutMarginsGuide.leadingAnchor, constant: 35).isActive = true
        muzi.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        
        apeach.translatesAutoresizingMaskIntoConstraints = false
        apeach.widthAnchor.constraint(equalToConstant: 30).isActive = true
        apeach.heightAnchor.constraint(equalToConstant: 30).isActive = true
        apeach.leadingAnchor.constraint(equalTo: muzi.layoutMarginsGuide.leadingAnchor, constant: 35).isActive = true
        apeach.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
        
        tube.translatesAutoresizingMaskIntoConstraints = false
        tube.widthAnchor.constraint(equalToConstant: 30).isActive = true
        tube.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tube.leadingAnchor.constraint(equalTo: apeach.layoutMarginsGuide.leadingAnchor, constant: 35).isActive = true
        tube.centerYAnchor.constraint(equalTo: bg.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    @objc func setMouse(_ sender: UIButton) {
        // 선택한 입 모양을 배경에 추가, 변경
        switch sender.tag {
        case 0:
            mouse.image = UIImage(named: "ryan.mouse")
        case 1:
            mouse.image = UIImage(named: "muzi.mouse")
        case 2:
            mouse.image = UIImage(named: "apeach.mouse")
        case 3:
            mouse.image = UIImage(named: "tube.mouse")
        default:
            break
        }
        self.view.addSubview(mouse)
        
        mouse.translatesAutoresizingMaskIntoConstraints = false
        mouse.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        mouse.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 30).isActive = true
    }
    
    @objc func hideView() {
        if self.colorView.isHidden == false {
            self.colorView.isHidden = true
        } else if self.eyeView.isHidden == false {
            self.eyeView.isHidden = true
        } else if self.mouseView.isHidden == false {
            self.mouseView.isHidden = true
        } else if self.menu.isHidden == false {
            self.isStatusBarHidden = true
            self.setNeedsStatusBarAppearanceUpdate()
            self.navigationController?.navigationBar.isHidden = true
            self.menu.isHidden = true
        } else if self.menu.isHidden == true {
            self.isStatusBarHidden = false
            self.setNeedsStatusBarAppearanceUpdate()
            self.navigationController?.navigationBar.isHidden = false
            self.menu.isHidden = false
        }
    }
}

extension UIButton {
    func circleBtn() {
        // 메뉴 목록 버튼 둥글게
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}

