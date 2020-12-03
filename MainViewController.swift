//
//  ViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/15.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    let list = [
        "화면 전환",
        "데이터 전달",
        "알림과 알림창",
        "텍스트필드와 이미지피커",
        "영화 API"
    ]
    let uicList = [
        "UI Custom - 탭바",
        "UI Custom - 텍스트필드",
        "UI Custom - 알림창",
        "UI Custom - 버튼",
        "UI Custom - 뷰",
        "UI Custom - 스테퍼",
        "UI Custom - 페이지"
    ]
    let dataList = [
        "데이터 저장 - NSUserDefaults",
        "데이터 저장 - Custom.plist"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "My Apps"
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 테이블뷰 섹션 개수
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 테이블뷰 헤더뷰
        let headerView = UIView()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블뷰 행 개수
        var cell = Int()
        switch section {
        case 0:
            cell = 1
        case 1:
            cell = self.list.count
        case 2:
            cell = self.uicList.count
        case 3:
            cell = self.dataList.count
        case 4:
            cell = 1
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블뷰 셀 내용
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "ListCell")
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset.left = 70.5
        if traitCollection.userInterfaceStyle == .light {
            cell.backgroundColor = .systemBackground
            tableView.backgroundColor = .secondarySystemBackground
        } else {
            cell.backgroundColor = .secondarySystemBackground
            tableView.backgroundColor = .systemBackground
        }
        
        let icon = UIImageView()
        icon.layer.cornerRadius = 16.5
        icon.layer.masksToBounds = true
        
        let menu = UILabel()
        menu.font = UIFont.systemFont(ofSize: 17)
        
        cell.addSubview(icon)
        cell.addSubview(menu)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: 33.5).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 33.5).isActive = true
        icon.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16).isActive = true
        menu.centerYAnchor.constraint(equalTo: icon.layoutMarginsGuide.centerYAnchor).isActive = true
        
        switch indexPath.section {
        case 0:
            let pv = UIImageView()
            pv.layer.cornerRadius = 35
            pv.layer.masksToBounds = true
            
            let ud = UserDefaults.standard
            if ud.object(forKey: "MainProfileImage") == nil {
                pv.image = UIImage(named: "profile.default")
            } else {
                if let imgData = ud.object(forKey: "MainProfileImage") as? NSData {
                    if let img = UIImage(data: imgData as Data) {
                        pv.image = img
                    }
                }
            }
            
            icon.isHidden = true
            
            let name = UILabel()
            name.font = UIFont.boldSystemFont(ofSize: 17)
            if ud.string(forKey: "name") == nil {
                name.text = "이름을 입력해주세요"
            } else if ud.string(forKey: "name") == "" {
                name.text = "이름을 입력해주세요"
            } else {
                name.text = ud.string(forKey: "name")
            }
            
            let detail = UILabel()
            detail.text = "Apple ID, iCloud, iTunes 및 App Store"
            detail.font = UIFont.systemFont(ofSize: 13)
            
            cell.addSubview(pv)
            cell.addSubview(name)
            cell.addSubview(detail)
            
            pv.translatesAutoresizingMaskIntoConstraints = false
            pv.widthAnchor.constraint(equalToConstant: 70).isActive = true
            pv.heightAnchor.constraint(equalToConstant: 70).isActive = true
            pv.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
            pv.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
            
            name.translatesAutoresizingMaskIntoConstraints = false
            name.leadingAnchor.constraint(equalTo: icon.layoutMarginsGuide.trailingAnchor, constant: 64).isActive = true
            name.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor, constant: -32).isActive = true
            name.centerYAnchor.constraint(equalTo: icon.layoutMarginsGuide.centerYAnchor, constant: -12).isActive = true
            
            detail.translatesAutoresizingMaskIntoConstraints = false
            detail.leadingAnchor.constraint(equalTo: icon.layoutMarginsGuide.trailingAnchor, constant: 64).isActive = true
            detail.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor, constant: -32).isActive = true
            detail.centerYAnchor.constraint(equalTo: icon.layoutMarginsGuide.centerYAnchor, constant: 12).isActive = true
        case 1:
            let iconList = [
                "ironman",
                "captainamerica",
                "thor",
                "hulk",
                "spiderman"
            ]
            icon.image = UIImage(named: iconList[indexPath.row])
            menu.text = self.list[indexPath.row]
        case 2:
            let iconList = [
                "kakaotalk",
                "naverlogomini",
                "pubg.head",
                "pubg.frypan",
                "muzi",
                "battery",
                ""
            ]
            icon.image = UIImage(named: iconList[indexPath.row])
            menu.text = self.uicList[indexPath.row]
        case 3:
            let iconList = [
                "profile.default",
                "instagram.icon"
            ]
            icon.image = UIImage(named: iconList[indexPath.row])
            menu.text = self.dataList[indexPath.row]
        case 4:
            icon.image = UIImage(named: "tori")
            menu.text = "MyNotes"
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 테이블뷰 셀 선택시
        self.tableView.deselectRow(at: indexPath, animated: true) // 테이블뷰 선택시 틴트 효과
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                modalView("SegueVC")
            case 1:
                modalView("DataVC")
            case 2:
                modalView("AlertVC")
            case 3:
                modalView("DelegateVC")
            case 4:
                modalView("MovieTBC")
            default:
                break
            }
        } else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                let vc = MessengerTabBarController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = NaverViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = PUBGAlertViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 3:
                let vc = PUBGButtonViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 4:
                let vc = KakaoFriendsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 5:
                let vc = CustomStepperViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 6:
                let vc = PageMainViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        } else if indexPath.section == 3 {
            switch indexPath.row {
            case 0:
                let vc = MainProfileViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = LoginViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        } else if indexPath.section == 4 {
            switch indexPath.row {
            case 0:
                let vc = MemoLogInViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 테이블뷰 행 높이
        if indexPath.section == 0 {
            return CGFloat(87)
        } else {
            return CGFloat(43.5)
        }
    }
    
    @objc func modalView(_ identifier: String) {
        // 스토리보드 화면 전환
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func home(_ sender: UIStoryboardSegue) {
        // 메인 뷰로 복귀하는 세그
    }
}

