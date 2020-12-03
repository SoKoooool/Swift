//
//  NewsViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/10.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        return v
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1 :
            return 10
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 8
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 77
            case 1:
                return 43.5
            case 2:
                return 33.5
            default:
                return 0
            }
        case 1:
            switch indexPath.row {
            case 0:
                return 43.5
            case 1:
                return 87
            case 7:
                return 43.5
            default:
                return 33.5
            }
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ListCell")
        self.tableView.backgroundColor = UIColor(displayP3Red: 239/255, green: 238/255, blue: 245/255, alpha: 1.0)
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = .black
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.separatorInset.left = 1000
                let banner = UIImageView()
                banner.image = UIImage(named: "img2")
                cell.addSubview(banner)
                
                banner.translatesAutoresizingMaskIntoConstraints = false
                banner.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                banner.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                banner.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
                banner.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
            case 1:
                cell.textLabel?.text = "언론사편집"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                
                let count = UILabel()
                count.text = "99"
                count.textColor = .systemGreen
                count.font = UIFont.boldSystemFont(ofSize: 12)
                
                let label = UILabel()
                label.text = "개 구독중"
                label.textColor = .darkGray
                label.font = UIFont.systemFont(ofSize: 12)
                
                let img = UIImageView()
                img.image = UIImage(systemName: "arrow.right.circle")
                img.image?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
                
                cell.addSubview(count)
                cell.addSubview(label)
                cell.addSubview(img)
                
                count.translatesAutoresizingMaskIntoConstraints = false
                count.trailingAnchor.constraint(equalTo: label.layoutMarginsGuide.leadingAnchor, constant: -7.5).isActive = true
                count.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
                
                label.translatesAutoresizingMaskIntoConstraints = false
                label.trailingAnchor.constraint(equalTo: img.layoutMarginsGuide.leadingAnchor, constant: -10).isActive = true
                label.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
                
                img.translatesAutoresizingMaskIntoConstraints = false
                img.widthAnchor.constraint(equalToConstant: 20).isActive = true
                img.heightAnchor.constraint(equalToConstant: 20).isActive = true
                img.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
                img.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
                
            case 2:
                let titlev = UIView()
                titlev.layer.borderWidth = 1.5
                titlev.layer.borderColor = UIColor(displayP3Red: 254/255, green: 144/255, blue: 143/255, alpha: 1.0).cgColor
                titlev.layer.cornerRadius = 10
                titlev.layer.masksToBounds = true
                
                let title = UILabel()
                title.text = "속보"
                title.font = UIFont.systemFont(ofSize: 12)
                title.textColor = .systemRed
                
                let content = UILabel()
                content.text = "정부 '수도권 거리두기 1.5단계 시행'... 2단계 격상도"
                content.font = UIFont.systemFont(ofSize: 14)
                content.textColor = .black
                
                let from = UILabel()
                from.text = "쏘쿨신문"
                from.font = UIFont.systemFont(ofSize: 12)
                from.textColor = .systemGray
                
                
                titlev.addSubview(title)
                cell.addSubview(titlev)
                cell.addSubview(content)
                cell.addSubview(from)
                
                titlev.translatesAutoresizingMaskIntoConstraints = false
                titlev.widthAnchor.constraint(equalToConstant: 30).isActive = true
                titlev.heightAnchor.constraint(equalToConstant: 20).isActive = true
                titlev.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
                titlev.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
                
                title.translatesAutoresizingMaskIntoConstraints = false
                title.centerXAnchor.constraint(equalTo: titlev.layoutMarginsGuide.centerXAnchor).isActive = true
                title.centerYAnchor.constraint(equalTo: titlev.layoutMarginsGuide.centerYAnchor).isActive = true
                
                content.translatesAutoresizingMaskIntoConstraints = false
                content.leadingAnchor.constraint(equalTo: titlev.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
                content.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
                
                from.translatesAutoresizingMaskIntoConstraints = false
                from.leadingAnchor.constraint(equalTo: content.layoutMarginsGuide.trailingAnchor).isActive = true
                from.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
                from.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "쏘쿨신문"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            case 1:
                let img = UIImageView()
                img.image = UIImage(named: "img1")
                
                let title = UILabel()
                title.text = "대형 마트의 갑질, 하이마트와 이마트몰 등 대형 마트들의 플스5 선착순 판매가 논란이 되고 있다."
                title.font = UIFont.systemFont(ofSize: 14)
                title.textColor = .black
                title.numberOfLines = 2
                
                let content = UILabel()
                content.text = "용산 판매자, 즉 용팔이로 통하는 업주들과 대형 마트들의 불법 커미션을 고발하는 청원까지 올라왔다"
                content.font = UIFont.systemFont(ofSize: 13)
                content.textColor = .darkGray
                content.numberOfLines = 2
                
                cell.addSubview(img)
                cell.addSubview(title)
                cell.addSubview(content)
                
                img.translatesAutoresizingMaskIntoConstraints = false
                img.widthAnchor.constraint(equalToConstant: 107).isActive = true
                img.heightAnchor.constraint(equalToConstant: 67).isActive = true
                img.leadingAnchor.constraint(equalTo: cell.layoutMarginsGuide.leadingAnchor).isActive = true
                img.centerYAnchor.constraint(equalTo: cell.layoutMarginsGuide.centerYAnchor).isActive = true
                
                title.translatesAutoresizingMaskIntoConstraints = false
                title.heightAnchor.constraint(equalToConstant: 33.5).isActive = true
                title.topAnchor.constraint(equalTo: img.topAnchor).isActive = true
                title.leadingAnchor.constraint(equalTo: img.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
                title.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
                
                content.translatesAutoresizingMaskIntoConstraints = false
                content.heightAnchor.constraint(equalToConstant: 33.5).isActive = true
                content.bottomAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
                content.leadingAnchor.constraint(equalTo: img.layoutMarginsGuide.trailingAnchor, constant: 20).isActive = true
                content.trailingAnchor.constraint(equalTo: cell.layoutMarginsGuide.trailingAnchor).isActive = true
            case 2:
                cell.textLabel?.text = "대다수의 응모자들은 용팔이의 매크로에 당했다며 분통을 터뜨리기도"
            case 3:
                cell.textLabel?.text = "한 응모자는, 자신은 후배에게 넘겨 받기로 했다며 주변의 부러움을 받았다"
            case 4:
                cell.textLabel?.text = "(그것이 알고싶다) 용팔이(개새), 그들은 대체 누구인가"
            case 5:
                cell.textLabel?.text = "용인 거주중인 김모씨(38) 플스5 당첨됐지만 미당첨자에게 넘겨"
            case 6:
                cell.textLabel?.text = "코로나 덮친 서래마을, 주민 홍모씨(33) 자식 걱정에 두려움에 떨고 있어..."
            case 7:
                cell.textLabel?.text = "전체기사보기"
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.textColor = .darkGray
            default:
                cell.textLabel?.text = "기사"
            }
        default:
            break
        }
        return cell
    }
}
