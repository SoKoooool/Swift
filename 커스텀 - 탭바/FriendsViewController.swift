//
//  FriendsViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/02.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class FriendsViewController: UITableViewController {
    let nameList = ["임성민", "강신현", "이문규"]
    let detailList = ["임담당", "강주현으로 개명합니다", "문신충"]
    let imgList = ["ism", "noprofile", "noprofile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(displayP3Red: 38/255, green: 40/255, blue: 45/255, alpha: 1.0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor(displayP3Red: 38/255, green: 40/255, blue: 45/255, alpha: 1.0)
        
        let title = UILabel()
        title.textColor = .systemGray
        title.font = UIFont.systemFont(ofSize: 13)
        
        let hide = UIButton(type: .system)
        hide.setImage(UIImage(named: "arrow.up")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        header.addSubview(title)
        header.addSubview(hide)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: header.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        title.centerYAnchor.constraint(equalTo: header.layoutMarginsGuide.centerYAnchor).isActive = true
        
        hide.translatesAutoresizingMaskIntoConstraints = false
        hide.widthAnchor.constraint(equalToConstant: 20).isActive = true
        hide.heightAnchor.constraint(equalToConstant: 20).isActive = true
        hide.trailingAnchor.constraint(equalTo: header.layoutMarginsGuide.trailingAnchor).isActive = true
        hide.leadingAnchor.constraint(equalTo: title.layoutMarginsGuide.trailingAnchor).isActive = true
        hide.centerYAnchor.constraint(equalTo: header.layoutMarginsGuide.centerYAnchor).isActive = true
        
        switch section {
        case 1:
            title.text = "즐겨찾기"
        case 2:
            title.text = "채널"
        case 3:
            title.text = "친구"
        default:
            break
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 43.5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 || section == 2 {
            return 1
        } else if section == 3 {
            return self.nameList.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ListCell")
        cell.backgroundColor = UIColor(displayP3Red: 38/255, green: 40/255, blue: 45/255, alpha: 1.0)
        
        
        let img = UIImageView()
        img.layer.cornerRadius = 17.5
        img.layer.masksToBounds = true
        
        let name = UILabel()
        name.font = UIFont(name: "KakaoBold", size: 16)
        
        let detail = UILabel()
        detail.font = UIFont(name: "KakaoBold", size: 12)
        detail.textColor = .systemGray
        
        cell.addSubview(img)
        cell.addSubview(name)
        cell.addSubview(detail)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 45).isActive = true
        img.heightAnchor.constraint(equalToConstant: 45).isActive = true
        img.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: img.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        name.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
        name.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor, constant: -10).isActive = true
        
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.leadingAnchor.constraint(equalTo: img.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
        detail.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
        detail.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor, constant: 10).isActive = true
        
        if indexPath.section == 0, indexPath.row == 1 {
            let myImg = UIImageView()
            myImg.layer.cornerRadius = 25
            myImg.layer.masksToBounds = true
            myImg.image = UIImage(named: "tori")
            
            let myName = UILabel()
            myName.font = UIFont(name: "KakaoBold", size: 20)
            myName.text = "SJSJ"
            
            cell.addSubview(myImg)
            cell.addSubview(myName)
            
            myImg.translatesAutoresizingMaskIntoConstraints = false
            myImg.widthAnchor.constraint(equalToConstant: 65).isActive = true
            myImg.heightAnchor.constraint(equalToConstant: 65).isActive = true
            myImg.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
            myImg.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
            
            myName.translatesAutoresizingMaskIntoConstraints = false
            myName.leadingAnchor.constraint(equalTo: myImg.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
            myName.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            myName.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
            
        } else if indexPath.section == 1 {
            img.image = UIImage(named: "noprofile")
            
            let favorite = UILabel()
            favorite.font = UIFont(name: "KakaoBold", size: 16)
            favorite.text = "없음"
            
            cell.addSubview(favorite)
            
            favorite.translatesAutoresizingMaskIntoConstraints = false
            favorite.leadingAnchor.constraint(equalTo: img.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
            favorite.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        } else if indexPath.section == 2 {
            img.image = UIImage(named: "channel")
            
            let channel = UILabel()
            channel.font = UIFont(name: "KakaoBold", size: 16)
            channel.text = "채널"
            
            cell.addSubview(channel)
            
            channel.translatesAutoresizingMaskIntoConstraints = false
            channel.leadingAnchor.constraint(equalTo: img.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
            channel.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        } else if indexPath.section == 3 {
            img.image = UIImage(named: "\(self.imgList[indexPath.row])")
            name.text = self.nameList[indexPath.row]
            detail.text = self.detailList[indexPath.row]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0, indexPath.row == 0 {
            return 13.5
        } else if indexPath.section == 0, indexPath.row == 1 {
            return 73.5
        } else {
            return 58.5
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = FriendsProfileViewController()
        if indexPath.section == 3 {
            switch indexPath.row {
            case 0:
                vc.paramName = self.nameList[0]
                vc.paramDetail = self.detailList[0]
                vc.paramImage = self.imgList[0]
                vc.paramBgImage = "ismbg"
            case 1:
                vc.paramName = self.nameList[1]
                vc.paramDetail = self.detailList[1]
                vc.paramImage = self.imgList[1]
                vc.paramBgImage = ""
            case 2:
                vc.paramName = self.nameList[2]
                vc.paramDetail = self.detailList[2]
                vc.paramImage = self.imgList[2]
                vc.paramBgImage = ""
            default:
                break
            }
        } else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
