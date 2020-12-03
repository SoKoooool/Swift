//
//  PageContentViewController.swift
//  MyApps
//
//  Created by TORI on 2020/11/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    let contentImage = UIImageView()
    
    var pageIndex: Int!
    var imgStr: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.setup()
    }
    
    func setup() {
        self.contentImage.image = self.imgStr
        self.view.addSubview(self.contentImage)
        
        self.contentImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.contentImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.contentImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.contentImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
