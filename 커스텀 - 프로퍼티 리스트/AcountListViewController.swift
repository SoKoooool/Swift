//
//  AcountListViewController.swift
//  MyApps
//
//  Created by TORI on 2020/10/06.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class AcountListViewController: UIViewController {
    let indicator = UIView()
    
    var v: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    var v1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    var imgList = [UIImage(named: "tori"), UIImage(named: "tori.circle")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.indicatorStyle = .black
        self.view.addSubview(scroll)
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.heightAnchor.constraint(equalToConstant: 300).isActive = true
        scroll.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        scroll.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor).isActive = true
        
        stack.addArrangedSubview(v)
        stack.addArrangedSubview(v1)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        v.leadingAnchor.constraint(equalTo: stack.leadingAnchor).isActive = true
        v.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        v.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        v1.leadingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        v1.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        v.delegate = self
        v.dataSource = self
        v.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        v.backgroundColor = .none
        
        v1.delegate = self
        v1.dataSource = self
        v1.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        v1.backgroundColor = .none
    }
}

extension AcountListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
            cell.contentView.backgroundColor = .black
            
            let img = UIImageView()
            img.image = self.imgList[indexPath.row]
            img.layer.borderColor = UIColor.black.cgColor
            img.layer.borderWidth = 1
            cell.contentView.addSubview(img)
            
            img.translatesAutoresizingMaskIntoConstraints = false
            img.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            img.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            img.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            img.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            return cell
    }
}

extension AcountListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 3)
            return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
