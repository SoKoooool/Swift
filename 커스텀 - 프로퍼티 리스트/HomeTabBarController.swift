//
//  HomeTabBarController.swift
//  MyApps
//
//  Created by TORI on 2020/10/13.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.setup()
    }
    
    func setup() {
        self.tabBar.barTintColor = .black
        
        let home = AcountListViewController()
        home.tabBarItem.image = UIImage(named: "instagram.icon.home")?.withRenderingMode(.alwaysOriginal)
        home.tabBarItem.selectedImage = UIImage(named: "instagram.icon.home.fill")?.withRenderingMode(.alwaysOriginal)
        home.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        home.tabBarItem.tag = 0
        
        let search = HomeViewController()
        search.tabBarItem.image = UIImage(named: "instagram.icon.search")?.withRenderingMode(.alwaysOriginal)
        search.tabBarItem.selectedImage = UIImage(named: "instagram.icon.search.fill")?.withRenderingMode(.alwaysOriginal)
        search.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        search.tabBarItem.tag = 1
        
        let camera = HomeViewController()
        camera.tabBarItem.image = UIImage(named: "instagram.icon.plus")?.withRenderingMode(.alwaysOriginal)
        camera.tabBarItem.selectedImage = UIImage(named: "instagram.icon.plus")?.withRenderingMode(.alwaysOriginal)
        camera.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        camera.tabBarItem.tag = 2
        
        let favorite = HomeViewController()
        favorite.tabBarItem.image = UIImage(named: "instagram.icon.heart")?.withRenderingMode(.alwaysOriginal)
        favorite.tabBarItem.selectedImage = UIImage(named: "instagram.icon.heart.fill")?.withRenderingMode(.alwaysOriginal)
        favorite.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        favorite.title = .none
        favorite.tabBarItem.tag = 3
        
        let myAcount = HomeViewController()
        myAcount.tabBarItem.image = UIImage(named: "person")?.withRenderingMode(.alwaysOriginal)
        myAcount.tabBarItem.selectedImage = UIImage(named: "person.fill")?.withRenderingMode(.alwaysOriginal)
        myAcount.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
        myAcount.tabBarItem.tag = 4
        
        self.setViewControllers([home, search, camera, favorite, myAcount], animated: true)
        self.selectedViewController = myAcount
    }
}
