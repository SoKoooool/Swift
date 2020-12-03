//
//  NaverViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/07.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class NaverViewController: UIViewController {
    let tf = UITextField()
    let naviBar = UINavigationBar()
    let scrollv = UIScrollView()
    let topBar = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "네이버"
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.delegate = self
        self.addToNaviBar()
        self.addToScrollView()
        self.loadToContainerView()
        self.switchToTabBarVC(viewController: NewsViewController())
    }
    
    func addToNaviBar() {
        // 네비게이션바
        self.naviBar.backgroundColor = UIColor(displayP3Red: 0/255, green: 194/255, blue: 85/255, alpha: 1.0)
        self.view.addSubview(naviBar)
        
        self.naviBar.translatesAutoresizingMaskIntoConstraints = false
        self.naviBar.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.naviBar.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.naviBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.naviBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        // 네비게이션 상단
        let topv = UIView()
        let menu = UIButton(type: .system)
        menu.setImage(UIImage(systemName: "text.justify"), for: .normal)
        menu.tintColor = .white

        let title = UILabel()
        title.text = "NAVER"
        title.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        title.textColor = .white
        title.textAlignment = .center

        let home = UIButton(type: .system)
        home.setImage(UIImage(systemName: "house.fill"), for: .normal)
        home.tintColor = .white
        home.addTarget(self, action: #selector(closeBtn), for: .touchUpInside)
        
        topv.addSubview(menu)
        topv.addSubview(title)
        topv.addSubview(home)
        self.naviBar.addSubview(topv)
        
        topv.translatesAutoresizingMaskIntoConstraints = false
        topv.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topv.topAnchor.constraint(equalTo: naviBar.layoutMarginsGuide.topAnchor).isActive = true
        topv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menu.heightAnchor.constraint(equalToConstant: 25).isActive = true
        menu.leadingAnchor.constraint(equalTo: topv.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        menu.centerYAnchor.constraint(equalTo: topv.layoutMarginsGuide.centerYAnchor).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: topv.layoutMarginsGuide.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: topv.layoutMarginsGuide.centerYAnchor).isActive = true
        
        home.translatesAutoresizingMaskIntoConstraints = false
        home.widthAnchor.constraint(equalToConstant: 30).isActive = true
        home.heightAnchor.constraint(equalToConstant: 25).isActive = true
        home.trailingAnchor.constraint(equalTo: topv.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        home.centerYAnchor.constraint(equalTo: topv.layoutMarginsGuide.centerYAnchor).isActive = true
        
        // 네비게이션 하단
        let bottomv = UIView()
        let logo = UILabel()
        logo.text = "N"
        logo.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        logo.textColor = .white
        logo.textAlignment = .center
        
        let searchView = UIView()
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 1
        searchView.layer.masksToBounds = true
        
        self.tf.textColor = .black
        self.tf.borderStyle = .none
        self.tf.clearButtonMode = .whileEditing
        self.tf.keyboardType = .URL
        self.tf.autocorrectionType = .no
        self.tf.autocapitalizationType = .none
        self.tf.spellCheckingType = .no
        
        let voice = UIButton(type: .system)
        voice.setImage(UIImage(systemName: "mic"), for: .normal)
        voice.tintColor = .systemGreen
        
        let camera = UIButton(type: .system)
        camera.setImage(UIImage(systemName: "camera"), for: .normal)
        camera.tintColor = .systemGreen
        
        searchView.addSubview(tf)
        searchView.addSubview(voice)
        searchView.addSubview(camera)
        bottomv.addSubview(logo)
        bottomv.addSubview(searchView)
        self.naviBar.addSubview(bottomv)
        
        bottomv.translatesAutoresizingMaskIntoConstraints = false
        bottomv.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomv.topAnchor.constraint(equalTo: topv.bottomAnchor).isActive = true
        bottomv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        bottomv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.widthAnchor.constraint(equalToConstant: 25).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        logo.leadingAnchor.constraint(equalTo: bottomv.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        logo.centerYAnchor.constraint(equalTo: bottomv.layoutMarginsGuide.centerYAnchor).isActive = true
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.heightAnchor.constraint(equalToConstant: 33.5).isActive = true
        searchView.leadingAnchor.constraint(equalTo: logo.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        searchView.trailingAnchor.constraint(equalTo: bottomv.layoutMarginsGuide.trailingAnchor).isActive = true
        searchView.centerYAnchor.constraint(equalTo: bottomv.layoutMarginsGuide.centerYAnchor).isActive = true
        
        self.tf.translatesAutoresizingMaskIntoConstraints = false
        self.tf.leadingAnchor.constraint(equalTo: logo.layoutMarginsGuide.trailingAnchor, constant: 25).isActive = true
        self.tf.centerYAnchor.constraint(equalTo: searchView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        voice.translatesAutoresizingMaskIntoConstraints = false
        voice.widthAnchor.constraint(equalToConstant: 30).isActive = true
        voice.heightAnchor.constraint(equalToConstant: 25).isActive = true
        voice.leadingAnchor.constraint(equalTo: self.tf.layoutMarginsGuide.trailingAnchor, constant: 5).isActive = true
        voice.centerYAnchor.constraint(equalTo: searchView.layoutMarginsGuide.centerYAnchor).isActive = true
        
        camera.translatesAutoresizingMaskIntoConstraints = false
        camera.widthAnchor.constraint(equalToConstant: 30).isActive = true
        camera.heightAnchor.constraint(equalToConstant: 25).isActive = true
        camera.leadingAnchor.constraint(equalTo: voice.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
        camera.trailingAnchor.constraint(equalTo: searchView.layoutMarginsGuide.trailingAnchor, constant: 2).isActive = true
        camera.centerYAnchor.constraint(equalTo: searchView.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    func addToScrollView() {
        // 컨텐츠뷰
        self.scrollv.backgroundColor = .white
        self.view.addSubview(scrollv)
        
        self.scrollv.translatesAutoresizingMaskIntoConstraints = false
        self.scrollv.topAnchor.constraint(equalTo: self.naviBar.bottomAnchor).isActive = true
        self.scrollv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func loadToContainerView() {
        // 컨텐츠 상단 탭바
        let news = UITabBarItem(title: "뉴스", image: nil, selectedImage: nil)
        news.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "KakaoBold", size: 16)!], for: .normal)
        news.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        news.tag = 0
        
        let entertainment = UITabBarItem(title: "연예", image: nil, selectedImage: nil)
        entertainment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "KakaoBold", size: 16)!], for: .normal)
        entertainment.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        entertainment.tag = 1

        let sports = UITabBarItem(title: "스포츠", image: nil, selectedImage: nil)
        sports.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "KakaoBold", size: 16)!], for: .normal)
        sports.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        sports.tag = 2

        let lifeStyle = UITabBarItem(title: "라이프", image: nil, selectedImage: nil)
        lifeStyle.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "KakaoBold", size: 16)!], for: .normal)
        lifeStyle.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        lifeStyle.tag = 3

        let shop = UITabBarItem(title: "쇼핑", image: nil, selectedImage: nil)
        shop.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "KakaoBold", size: 16)!], for: .normal)
        shop.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        shop.tag = 4

        self.topBar.delegate = self
        self.topBar.setItems([news, entertainment, sports, lifeStyle, shop], animated: true)
        self.topBar.tintColor = .systemGreen
        self.topBar.barTintColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        self.topBar.unselectedItemTintColor = .black
        self.topBar.selectedItem = news
        self.scrollv.addSubview(topBar)

        self.topBar.translatesAutoresizingMaskIntoConstraints = false
        self.topBar.heightAnchor.constraint(equalToConstant: 33.5).isActive = true
        self.topBar.topAnchor.constraint(equalTo: self.scrollv.topAnchor).isActive = true
        self.topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

    func switchToTabBarVC(viewController: UIViewController) {
        // 탭바 하위뷰
        let child = viewController
        child.didMove(toParent: self)
        self.addChild(child)
        self.scrollv.addSubview(child.view)
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.topAnchor.constraint(equalTo: self.topBar.bottomAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        child.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        child.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    @objc func closeBtn() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tf.resignFirstResponder()
    }
}

// MARK: - 탭바 설정

extension NaverViewController: UITabBarDelegate, UITabBarControllerDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            self.switchToTabBarVC(viewController: NewsViewController())
        case 1:
            self.switchToTabBarVC(viewController: EntertainmentViewController())
        case 2:
            self.switchToTabBarVC(viewController: SportsViewController())
        case 3:
            self.switchToTabBarVC(viewController: LifeStyleViewController())
        case 4:
            self.switchToTabBarVC(viewController: ShoppingViewController())
        default:
            break
        }
    }
}
