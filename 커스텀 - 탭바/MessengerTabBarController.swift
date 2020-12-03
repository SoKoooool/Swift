//
//  MessengerTabBarController.swift
//  MyApps
//
//  Created by TORI on 2020/09/01.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class MessengerTabBarController: UITabBarController {
    let topbarTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "카카오톡"
        self.tabBar.barTintColor = .black
        
        let friends = FriendsViewController()
        friends.tabBarItem.image = UIImage(named: "person")?.withRenderingMode(.alwaysOriginal)
        friends.tabBarItem.selectedImage = UIImage(named: "person.fill")?.withRenderingMode(.alwaysOriginal)
        friends.tabBarItem.tag = 0
        
        let chat = ChatViewController()
        chat.tabBarItem.image = UIImage(named: "chat")?.withRenderingMode(.alwaysOriginal)
        chat.tabBarItem.selectedImage = UIImage(named: "chat.fill")?.withRenderingMode(.alwaysOriginal)
        chat.tabBarItem.tag = 1
        
        let more = MoreViewController()
        more.tabBarItem.image = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        more.tabBarItem.selectedImage = UIImage(named: "more.fill")?.withRenderingMode(.alwaysOriginal)
        more.tabBarItem.tag = 2
        
        self.setViewControllers([friends, chat, more], animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let topBar = UITabBar()
        topBar.barTintColor = UIColor(displayP3Red: 20/255, green: 22/255, blue: 27/255, alpha: 1.0)
        
        self.topbarTitle.font = UIFont(name: "KakaoBold", size: 25)
        self.topbarTitle.text = "친구"
        
        topBar.addSubview(topbarTitle)
        
        let search = UIButton(type: .system)
        search.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        let add = UIButton(type: .system)
        add.setImage(UIImage(named: "addfriends")?.withRenderingMode(.alwaysOriginal), for: .normal)
        let music = UIButton(type: .system)
        music.setImage(UIImage(named: "music")?.withRenderingMode(.alwaysOriginal), for: .normal)
        let setting = UIButton(type: .system)
        setting.setImage(UIImage(named: "setting")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        topBar.addSubview(search)
        topBar.addSubview(add)
        topBar.addSubview(music)
        topBar.addSubview(setting)
        self.view.addSubview(topBar)
        
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topBar.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.topbarTitle.translatesAutoresizingMaskIntoConstraints = false
        self.topbarTitle.leadingAnchor.constraint(equalTo: topBar.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        self.topbarTitle.centerYAnchor.constraint(equalTo: topBar.layoutMarginsGuide.centerYAnchor).isActive = true
        
        search.translatesAutoresizingMaskIntoConstraints = false
        search.widthAnchor.constraint(equalToConstant: 20).isActive = true
        search.heightAnchor.constraint(equalToConstant: 20).isActive = true
        search.centerYAnchor.constraint(equalTo: topBar.layoutMarginsGuide.centerYAnchor).isActive = true
        search.trailingAnchor.constraint(equalTo: add.layoutMarginsGuide.leadingAnchor, constant: -25).isActive = true
        
        add.translatesAutoresizingMaskIntoConstraints = false
        add.widthAnchor.constraint(equalToConstant: 23).isActive = true
        add.heightAnchor.constraint(equalToConstant: 20).isActive = true
        add.centerYAnchor.constraint(equalTo: topBar.layoutMarginsGuide.centerYAnchor).isActive = true
        add.trailingAnchor.constraint(equalTo: music.layoutMarginsGuide.leadingAnchor, constant: -25).isActive = true
        
        music.translatesAutoresizingMaskIntoConstraints = false
        music.widthAnchor.constraint(equalToConstant: 20).isActive = true
        music.heightAnchor.constraint(equalToConstant: 20).isActive = true
        music.centerYAnchor.constraint(equalTo: topBar.layoutMarginsGuide.centerYAnchor).isActive = true
        music.trailingAnchor.constraint(equalTo: setting.layoutMarginsGuide.leadingAnchor, constant: -25).isActive = true
        
        setting.translatesAutoresizingMaskIntoConstraints = false
        setting.widthAnchor.constraint(equalToConstant: 20).isActive = true
        setting.heightAnchor.constraint(equalToConstant: 20).isActive = true
        setting.centerYAnchor.constraint(equalTo: topBar.layoutMarginsGuide.centerYAnchor).isActive = true
        setting.trailingAnchor.constraint(equalTo: topBar.layoutMarginsGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            self.topbarTitle.text = "친구"
            self.title = "친구"
        case 1:
            self.topbarTitle.text = "채팅"
            self.title = "채팅"
        case 2:
            self.topbarTitle.text = "설정"
            self.title = "설정"
        default:
            break
        }
    }
}
