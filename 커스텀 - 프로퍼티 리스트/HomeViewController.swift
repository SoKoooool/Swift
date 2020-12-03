//
//  HomeViewController.swift
//  MyApps
//
//  Created by TORI on 2020/10/12.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let n = UINavigationBar()
    let profilePicker = UIImagePickerController()
    let postPicker = UIImagePickerController()
    let profileImg = UIButton(type: .system)
    let imgScroll = UIScrollView()
    
    var imgList = [Data]()
    var tagMeImgList = [UIImage(named: "tori.circle"), UIImage(named: "antman"), UIImage(named: "blackpanther"), UIImage(named: "doctorstrange"), UIImage(named: "vision")]
    
    var imgCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    var tagCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.setup()
    }
    
    func setup() {
        // 계정명.plist 불러오기
        let ud = UserDefaults.standard
        let idPlist = ud.value(forKey: "id")
        let customPlist = "\(idPlist!).plist"
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = paths[0] as NSString
        let clist = path.strings(byAppendingPaths: [customPlist]).first!
        let data = NSDictionary(contentsOfFile: clist)
        
        // 네비게이션바.뷰
        let myAcount = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let myAcountList = UIButton(type: .system)
        myAcountList.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        myAcountList.setTitle("\((data?["id"] as? String)!) ⌵", for: .normal)
        myAcountList.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        myAcountList.addTarget(self, action: #selector(backToPage), for: .touchUpInside)
        myAcount.addSubview(myAcountList)
        self.tabBarController?.navigationItem.titleView = myAcount
        
        // 네비게이션바.좌측 바 버튼
        let newPost = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(uploadToImage))
        self.tabBarController?.navigationItem.leftBarButtonItem = newPost
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        // 네비게이션바.우측 바 버튼
        let menu = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: nil)
        self.tabBarController?.navigationItem.rightBarButtonItem = menu
        
        // 프로필 스택뷰V
        let profileVStack = UIStackView()
        profileVStack.axis = .vertical
        profileVStack.alignment = .fill
        profileVStack.distribution = .fill
        profileVStack.spacing = 16
        self.view.addSubview(profileVStack)
        
        profileVStack.translatesAutoresizingMaskIntoConstraints = false
        profileVStack.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 16).isActive = true
        profileVStack.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        // 프로필 스택뷰V.스택뷰H
        let topHStack = UIStackView()
        topHStack.axis = .horizontal
        topHStack.alignment = .fill
        topHStack.distribution = .fillEqually
        profileVStack.addArrangedSubview(topHStack)
        
        topHStack.translatesAutoresizingMaskIntoConstraints = false
        topHStack.leadingAnchor.constraint(equalTo: profileVStack.leadingAnchor).isActive = true
        topHStack.trailingAnchor.constraint(equalTo: profileVStack.trailingAnchor).isActive = true
        
        // 프로필 스택뷰V.이름 레이블
        let name = UILabel()
        name.text = "\((data?["name"] as? String)!)\n\((data?["intro"] as? String)!)"
        name.numberOfLines = 4
        name.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        profileVStack.addArrangedSubview(name)
        
        // 프로필 스택뷰V.프로필 편집 버튼
        let profileedit = UIButton(type: .custom)
        profileedit.setTitle("프로필 편집", for: .normal)
        profileedit.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        profileedit.backgroundColor = .black
        profileedit.layer.borderWidth = 1
        profileedit.layer.borderColor = UIColor.darkGray.cgColor
        profileedit.layer.cornerRadius = 5
        profileedit.layer.masksToBounds = true
        profileVStack.addArrangedSubview(profileedit)
        
        profileedit.translatesAutoresizingMaskIntoConstraints = false
        profileedit.heightAnchor.constraint(equalToConstant: 25).isActive = true
        profileedit.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        profileedit.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        // 프로필 스택뷰V.스택뷰H.이미지 버튼
        if data?.object(forKey: "img") == nil {
            self.profileImg.setImage(UIImage(named: "profile.default")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            if let imgData = data?.object(forKey: "img") as? NSData {
                if let img = UIImage(data: imgData as Data) {
                    self.profileImg.setImage(img.withRenderingMode(.alwaysOriginal), for: .normal)
                }
            }
        }
        self.profileImg.addTarget(self, action: #selector(changeToProfileImage), for: .touchUpInside)
        self.profileImg.layer.cornerRadius = 43.5
        self.profileImg.layer.masksToBounds = true
        topHStack.addArrangedSubview(self.profileImg)
        
        self.profileImg.translatesAutoresizingMaskIntoConstraints = false
        self.profileImg.heightAnchor.constraint(equalTo: self.profileImg.widthAnchor).isActive = true
        
        // 프로필 스택뷰V.스택뷰H.이미지 버튼.이미지
        let plus = UILabel()
        plus.text = "＋"
        plus.font = UIFont.systemFont(ofSize: 28)
        plus.textAlignment = .center
        plus.textColor = .white
        plus.backgroundColor = UIColor(displayP3Red: 45/255, green: 130/255, blue: 234/255, alpha: 1.0)
        plus.layer.borderColor = UIColor.black.cgColor
        plus.layer.borderWidth = 1
        plus.layer.cornerRadius = 12.5
        plus.layer.masksToBounds = true
        topHStack.addSubview(plus)

        plus.translatesAutoresizingMaskIntoConstraints = false
        plus.widthAnchor.constraint(equalToConstant: 25).isActive = true
        plus.heightAnchor.constraint(equalToConstant: 25).isActive = true
        plus.bottomAnchor.constraint(equalTo: self.profileImg.bottomAnchor).isActive = true
        plus.trailingAnchor.constraint(equalTo: self.profileImg.trailingAnchor).isActive = true
        
        // 프로필 스택뷰V.스택뷰H.게시물 수 버튼
        let content = UIButton(type: .system)
        content.setTitle("\(self.imgList.count)\n게시물", for: .normal)
        content.setFontStyle()
        topHStack.addArrangedSubview(content)
        
        let numFont = UIFont.systemFont(ofSize: 14, weight: .heavy)
        let contentAttributedStr = NSMutableAttributedString(string: (content.titleLabel?.text)!)
        contentAttributedStr.addAttribute(.font, value: numFont, range: ((content.titleLabel?.text)! as NSString).range(of: "\(self.imgList.count)"))
        content.titleLabel?.attributedText = contentAttributedStr
        
        // 프로필 스택뷰V.스택뷰H.팔로워 수 버튼
        let follower = UIButton(type: .system)
        follower.setTitle("86만\n팔로워", for: .normal)
        follower.setFontStyle()
        topHStack.addArrangedSubview(follower)
        
        let followerAttributedStr = NSMutableAttributedString(string: (follower.titleLabel?.text)!)
        followerAttributedStr.addAttribute(.font, value: numFont, range: ((follower.titleLabel?.text)! as NSString).range(of: "86만"))
        follower.titleLabel?.attributedText = followerAttributedStr
        
        // 프로필 스택뷰V.스택뷰H.팔로잉 수 버튼
        let following = UIButton(type: .system)
        following.setTitle("8\n팔로잉", for: .normal)
        following.setFontStyle()
        topHStack.addArrangedSubview(following)
        
        let followingAttributedStr = NSMutableAttributedString(string: (following.titleLabel?.text)!)
        followingAttributedStr.addAttribute(.font, value: numFont, range: ((following.titleLabel?.text)! as NSString).range(of: "8"))
        following.titleLabel?.attributedText = followingAttributedStr
        
        // 게시물 탭바 스택뷰H
        let imgTabBar = UIStackView()
        imgTabBar.axis = .horizontal
        imgTabBar.alignment = .fill
        imgTabBar.distribution = .fillEqually
        self.view.addSubview(imgTabBar)
        
        imgTabBar.translatesAutoresizingMaskIntoConstraints = false
        imgTabBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgTabBar.topAnchor.constraint(equalTo: profileVStack.layoutMarginsGuide.bottomAnchor).isActive = true
        imgTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imgTabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // 게시물 탭바 스택뷰H.나의 게시물 버튼
        let myPhoto = UIButton(type: .system)
        myPhoto.setImage(UIImage(systemName: "rectangle.split.3x3"), for: .normal)
        myPhoto.addTarget(self, action: #selector(moveToFirstTab), for: .touchUpInside)
        imgTabBar.addArrangedSubview(myPhoto)
        
        // 게시물 탭바 스택뷰H.나를 태그한 게시물 버튼
        let tagMePhoto = UIButton(type: .system)
        tagMePhoto.setImage(UIImage(systemName: "person.crop.rectangle"), for: .normal)
        tagMePhoto.addTarget(self, action: #selector(moveToSecondTab), for: .touchUpInside)
        imgTabBar.addArrangedSubview(tagMePhoto)
        
        // 이미지 스크롤뷰
        self.imgScroll.isPagingEnabled = true
        self.imgScroll.bounces = false
        self.imgScroll.contentSize.width = self.view.frame.width * 2
        self.view.addSubview(self.imgScroll)
        
        self.imgScroll.translatesAutoresizingMaskIntoConstraints = false
        self.imgScroll.topAnchor.constraint(equalTo: imgTabBar.bottomAnchor).isActive = true
        self.imgScroll.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        self.imgScroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.imgScroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // 이미지 스크롤뷰.나의 게시물 컬렉션뷰
        self.imgCollection.delegate = self
        self.imgCollection.dataSource = self
        self.imgCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        self.imgCollection.bounces = false
        self.imgCollection.backgroundColor = .none
        self.imgScroll.addSubview(self.imgCollection)
        
        self.imgCollection.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.imgCollection.topAnchor.constraint(equalTo: imgTabBar.bottomAnchor).isActive = true
        self.imgCollection.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        // 이미지 스크롤뷰.나를 태그한 게시물 컬렉션뷰
        self.tagCollection.delegate = self
        self.tagCollection.dataSource = self
        self.tagCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        self.tagCollection.bounces = false
        self.tagCollection.backgroundColor = .none
        self.imgScroll.addSubview(self.tagCollection)
        
        self.tagCollection.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.tagCollection.topAnchor.constraint(equalTo: imgTabBar.bottomAnchor).isActive = true
        self.tagCollection.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        self.tagCollection.leadingAnchor.constraint(equalTo: self.imgCollection.trailingAnchor).isActive = true
        
        if self.traitCollection.userInterfaceStyle == .light {
            myAcountList.tintColor = .black
            newPost.tintColor = .black
            menu.tintColor = .black
            myPhoto.tintColor = .black
            tagMePhoto.tintColor = .black
        } else {
            myAcountList.tintColor = .white
            newPost.tintColor = .white
            menu.tintColor = .white
            myPhoto.tintColor = .white
            tagMePhoto.tintColor = .white
        }
    }
    
    @objc func backToPage() {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func uploadToImage() {
        // 새 게시물 이미지 피커
        self.postPicker.delegate = self
        self.postPicker.allowsEditing = true
        self.postPicker.sourceType = .photoLibrary
        self.postPicker.modalPresentationStyle = .fullScreen
        self.present(postPicker, animated: true)
    }
    
    @objc func changeToProfileImage() {
        // 프로필 이미지 피커
        self.profilePicker.delegate = self
        self.profilePicker.allowsEditing = true
        self.profilePicker.sourceType = .savedPhotosAlbum
        self.profilePicker.modalPresentationStyle = .fullScreen
        self.present(profilePicker, animated: true)
    }

    @objc func moveToFirstTab() {
        // 나의 게시물로 스크롤 애니메이션
        self.imgScroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @objc func moveToSecondTab() {
        // 나를 태그한 게시물로 스크롤 애니메이션
        self.imgScroll.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: true)
    }
}

// MARK: - 컬렉션뷰 델리게이트

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.imgCollection {
            return self.imgList.count
        } else if collectionView == self.tagCollection {
            return self.tagMeImgList.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        cell.contentView.backgroundColor = .black
        
        if collectionView == self.imgCollection {
            let ud = UserDefaults.standard
            let idPlist = ud.value(forKey: "id")
            let customPlist = "\(idPlist!).plist"
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let path = paths[0] as NSString
            let clist = path.strings(byAppendingPaths: [customPlist]).first!
            let data = NSDictionary(contentsOfFile: clist)
            
            let imgCollection = UIImageView()
            imgCollection.layer.borderColor = UIColor.black.cgColor
            imgCollection.layer.borderWidth = 1
            #warning("새 게시물 이미지 피커는 되는데 게시물 저장이 안됨")
            if let imgData = data?.object(forKey: "imgList") as? [NSData] {
                let img = UIImage(data: imgData[indexPath.row] as Data)
                imgCollection.image = img
            }
            cell.contentView.addSubview(imgCollection)

            imgCollection.translatesAutoresizingMaskIntoConstraints = false
            imgCollection.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            imgCollection.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            imgCollection.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            imgCollection.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        } else if collectionView == self.tagCollection {
            let img = UIImageView()
            img.image = self.tagMeImgList[indexPath.row]
            img.layer.borderColor = UIColor.black.cgColor
            img.layer.borderWidth = 1
            cell.contentView.addSubview(img)
            
            img.translatesAutoresizingMaskIntoConstraints = false
            img.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            img.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            img.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            img.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        }
        return cell
    }
}

// MARK: - 컬렉션뷰 레이아웃

extension HomeViewController: UICollectionViewDelegateFlowLayout {
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

// MARK: - 이미지 피커 델리게이트

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == self.postPicker {
            self.dismiss(animated: true) { () in // (_) 아님 주의!!
                let ud = UserDefaults.standard
                let idPlist = ud.value(forKey: "id")
                let customPlist = "\(idPlist!).plist"
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let path = paths[0] as NSString
                let plist = path.strings(byAppendingPaths: [customPlist]).first!
                let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
                
                let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                let jpgImage = img!.jpegData(compressionQuality: 1.0)
                self.imgList.append(jpgImage!)
                data.setValue(self.imgList, forKey: "imgList")
                data.write(toFile: plist, atomically: true)
                
                self.imgCollection.reloadData()
            }
        } else if picker == self.profilePicker {
            self.dismiss(animated: true) { () in // (_) 아님 주의!!
                let ud = UserDefaults.standard
                let idPlist = ud.value(forKey: "id")
                let customPlist = "\(idPlist!).plist"
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let path = paths[0] as NSString
                let plist = path.strings(byAppendingPaths: [customPlist]).first!
                let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
                
                let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                self.profileImg.setImage(img?.withRenderingMode(.alwaysOriginal), for: .normal)
                let jpgImage = img!.jpegData(compressionQuality: 0.1)
                data.setValue(jpgImage, forKey: "img")
                data.write(toFile: plist, atomically: true)
            }
        }
    }
}

extension UIButton {
    func setFontStyle() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.lineBreakMode = .byWordWrapping
        if self.traitCollection.userInterfaceStyle == .light {
            self.setTitleColor(.black, for: .normal)
        } else {
            self.setTitleColor(.white, for: .normal)
        }
    }
}
