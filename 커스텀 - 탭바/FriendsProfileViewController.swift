//
//  FriendsProfileViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/03.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class FriendsProfileViewController: UIViewController {
    var paramName: String!
    var paramDetail: String!
    var paramImage: String!
    var paramBgImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(displayP3Red: 20/255, green: 22/255, blue: 27/255, alpha: 1.0)
        self.profileView()
    }
    
    func profileView() {
        // background image
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "\(self.paramBgImage!)")
        bgImage.alpha = 0.5
        self.view.addSubview(bgImage)
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        bgImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        bgImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        bgImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bgImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // topview
        let topView = UIView()
        topView.backgroundColor = .none
        
        let back = UIButton(type: .system)
        back.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysOriginal), for: .normal)
        back.addTarget(self, action: #selector(backBtn(_:)), for: .touchUpInside)
        
        let sendGift = UIButton(type: .system)
        sendGift.setImage(UIImage(named: "gift")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        let sendMoney = UIButton(type: .system)
        sendMoney.setImage(UIImage(named: "krw")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        let addFavorite = UIButton(type: .system)
        addFavorite.setImage(UIImage(named: "star")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.view.addSubview(topView)
        topView.addSubview(back)
        topView.addSubview(sendGift)
        topView.addSubview(sendMoney)
        topView.addSubview(addFavorite)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        topView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        topView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        back.translatesAutoresizingMaskIntoConstraints = false
        back.widthAnchor.constraint(equalToConstant: 20).isActive = true
        back.heightAnchor.constraint(equalToConstant: 20).isActive = true
        back.leadingAnchor.constraint(equalTo: topView.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        back.centerYAnchor.constraint(equalTo: topView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        sendGift.translatesAutoresizingMaskIntoConstraints = false
        sendGift.widthAnchor.constraint(equalToConstant: 25).isActive = true
        sendGift.heightAnchor.constraint(equalToConstant: 25).isActive = true
        sendGift.trailingAnchor.constraint(equalTo: sendMoney.layoutMarginsGuide.leadingAnchor, constant: -25).isActive = true
        sendGift.centerYAnchor.constraint(equalTo: topView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        sendMoney.translatesAutoresizingMaskIntoConstraints = false
        sendMoney.widthAnchor.constraint(equalToConstant: 25).isActive = true
        sendMoney.heightAnchor.constraint(equalToConstant: 25).isActive = true
        sendMoney.trailingAnchor.constraint(equalTo: addFavorite.layoutMarginsGuide.leadingAnchor, constant: -25).isActive = true
        sendMoney.centerYAnchor.constraint(equalTo: topView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        addFavorite.translatesAutoresizingMaskIntoConstraints = false
        addFavorite.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addFavorite.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addFavorite.trailingAnchor.constraint(equalTo: topView.layoutMarginsGuide.trailingAnchor, constant: -10).isActive = true
        addFavorite.centerYAnchor.constraint(equalTo: topView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        // profile
        let profileImage = UIImageView()
        profileImage.layer.cornerRadius = 40
        profileImage.layer.masksToBounds = true
        profileImage.image = UIImage(named: "\(self.paramImage!)")
        
        let profileName = UILabel()
        profileName.font = UIFont(name: "KakaoBold", size: 20)
        profileName.text = self.paramName!
        
        let profileDetail = UILabel()
        profileDetail.font = UIFont(name: "KakaoBold", size: 15)
        profileDetail.text = self.paramDetail!
        
        self.view.addSubview(profileImage)
        self.view.addSubview(profileName)
        self.view.addSubview(profileDetail)
        
        
        
        // tabbar
        let onChat = UITabBarItem()
        onChat.image = UIImage(named: "chat.fill")?.withRenderingMode(.alwaysOriginal)
        onChat.title = "1:1 채팅"
        
        let call = UITabBarItem()
        call.image = UIImage(named: "call")?.withRenderingMode(.alwaysOriginal)
        call.title = "통화하기"
        
        let story = UITabBarItem()
        story.image = UIImage(named: "kakaostory")?.withRenderingMode(.alwaysOriginal)
        story.title = "카카오스토리"
        
        let bottomBar = UITabBar()
        bottomBar.backgroundImage = UIImage()
        bottomBar.unselectedItemTintColor = .white
        bottomBar.tintColor = .white
        bottomBar.setItems([onChat, call, story], animated: true)
        bottomBar.itemPositioning = .centered
        self.view.addSubview(bottomBar)
        
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        bottomBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
        bottomBar.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: profileName.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.bottomAnchor.constraint(equalTo: profileDetail.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        profileName.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        profileDetail.translatesAutoresizingMaskIntoConstraints = false
        profileDetail.bottomAnchor.constraint(equalTo: bottomBar.layoutMarginsGuide.topAnchor, constant: -40).isActive = true
        profileDetail.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    @objc func backBtn(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
