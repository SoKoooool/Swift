//
//  PUBGAlertViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/13.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit
import MapKit

class PUBGAlertViewController: UIViewController {
    // 위치 설정 구현 해놓은거 나중에 쓰려고 안지움
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "배틀그라운드"
        self.view.backgroundColor = .black
        self.addToBtn()
    }
    
    func addToBtn() {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "pubg")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        btn.addTarget(self, action: #selector(customAlert), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        btn.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor).isActive = true
        
        let btnImage = UIImageView()
        btnImage.image = UIImage(named: "touch")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        self.view.addSubview(btnImage)
        
        btnImage.translatesAutoresizingMaskIntoConstraints = false
        btnImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btnImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnImage.bottomAnchor.constraint(equalTo: btn.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        btnImage.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor, constant: 100).isActive = true
    }
    
    @objc func customAlert() {
        // 커스텀 알림창
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)

        let bgv = UIView()
        bgv.backgroundColor = .clear
        vc.view.addSubview(bgv)
        
        bgv.translatesAutoresizingMaskIntoConstraints = false
        bgv.widthAnchor.constraint(equalToConstant: 250).isActive = true
        bgv.heightAnchor.constraint(equalToConstant: 350).isActive = true
        bgv.centerXAnchor.constraint(equalTo: vc.view.layoutMarginsGuide.centerXAnchor).isActive = true
        bgv.centerYAnchor.constraint(equalTo: vc.view.layoutMarginsGuide.centerYAnchor).isActive = true
        
        // 알림창 로고
        let logo = UIImageView()
        logo.image = UIImage(named: "PUBGConsoleLogo")?.withRenderingMode(.alwaysOriginal)
        
        // 알림창 내용
        let alert = UIView()
        alert.layer.cornerRadius = 10
        alert.layer.masksToBounds = true
        
        bgv.addSubview(logo)
        bgv.addSubview(alert)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.widthAnchor.constraint(equalToConstant: 180).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logo.topAnchor.constraint(equalTo: bgv.layoutMarginsGuide.topAnchor).isActive = true
        logo.centerXAnchor.constraint(equalTo: bgv.layoutMarginsGuide.centerXAnchor).isActive = true
        
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.widthAnchor.constraint(equalToConstant: 235).isActive = true
        alert.heightAnchor.constraint(equalToConstant: 220).isActive = true
        alert.topAnchor.constraint(equalTo: logo.layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
        alert.centerXAnchor.constraint(equalTo: bgv.layoutMarginsGuide.centerXAnchor).isActive = true
        
        // 로그인 배경
        let bg = UIImageView()
        bg.image = UIImage(named: "pubg.background")
        
        alert.addSubview(bg)
        
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.topAnchor.constraint(equalTo: alert.topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: alert.bottomAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: alert.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: alert.trailingAnchor).isActive = true
        
        // 로그인 내용
        let title = UILabel()
        title.text = "Log In"
        title.font = UIFont(name: "HeadlinerNo.45", size: 30)
        title.textAlignment = .center
        title.textColor = .black
        
        let idImage = UIImageView()
        idImage.image = UIImage(named: "pubg.head")?.withRenderingMode(.alwaysOriginal)
        
        let id = UITextField()
        id.borderStyle = .roundedRect
        id.placeholder = "ID"
        id.font = UIFont.systemFont(ofSize: 14)
        
        let pwImage = UIImageView()
        pwImage.image = UIImage(named: "pubg.frypan")?.withRenderingMode(.alwaysOriginal)
        
        let pw = UITextField()
        pw.borderStyle = .roundedRect
        pw.placeholder = "Password"
        pw.font = UIFont.systemFont(ofSize: 14)
        pw.isSecureTextEntry = true
        
        alert.addSubview(title)
        alert.addSubview(idImage)
        alert.addSubview(id)
        alert.addSubview(pwImage)
        alert.addSubview(pw)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: alert.layoutMarginsGuide.topAnchor, constant: 5).isActive = true
        title.centerXAnchor.constraint(equalTo: alert.layoutMarginsGuide.centerXAnchor).isActive = true
        
        idImage.translatesAutoresizingMaskIntoConstraints = false
        idImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        idImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        idImage.topAnchor.constraint(equalTo: title.layoutMarginsGuide.bottomAnchor, constant: 15).isActive = true
        idImage.leadingAnchor.constraint(equalTo: alert.layoutMarginsGuide.leadingAnchor).isActive = true
        
        id.translatesAutoresizingMaskIntoConstraints = false
        id.heightAnchor.constraint(equalToConstant: 30).isActive = true
        id.leadingAnchor.constraint(equalTo: idImage.layoutMarginsGuide.trailingAnchor, constant: 15).isActive = true
        id.trailingAnchor.constraint(equalTo: alert.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        id.centerYAnchor.constraint(equalTo: idImage.layoutMarginsGuide.centerYAnchor).isActive = true
        
        pwImage.translatesAutoresizingMaskIntoConstraints = false
        pwImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        pwImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        pwImage.topAnchor.constraint(equalTo: idImage.layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
        pwImage.leadingAnchor.constraint(equalTo: alert.layoutMarginsGuide.leadingAnchor).isActive = true
        
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pw.leadingAnchor.constraint(equalTo: pwImage.layoutMarginsGuide.trailingAnchor, constant: 15).isActive = true
        pw.trailingAnchor.constraint(equalTo: alert.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        pw.centerYAnchor.constraint(equalTo: pwImage.layoutMarginsGuide.centerYAnchor).isActive = true
        
        // 로그인 버튼
        let ok = UIButton(type: .custom)
        ok.addTarget(self, action: #selector(closeBtn), for: .touchUpInside)
        ok.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
        ok.setTitle("OK", for: .normal)
        ok.setTitleColor(.black, for: .normal)
        ok.setBackgroundImage(UIImage(named: "systemGreen.button"), for: .normal)
        ok.setBackgroundImage(UIImage(named: "systemGreen.click.button"), for: .highlighted)
        ok.layer.borderWidth = 1.5
        ok.layer.borderColor = UIColor.black.cgColor
        ok.layer.cornerRadius = 8
        ok.layer.masksToBounds = true
        
        let cancel = UIButton(type: .custom)
        cancel.addTarget(self, action: #selector(closeBtn), for: .touchUpInside)
        cancel.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
        cancel.setTitle("CANCEL", for: .normal)
        cancel.setTitleColor(.black, for: .normal)
        cancel.setBackgroundImage(UIImage(named: "systemRed.button"), for: .normal)
        cancel.setBackgroundImage(UIImage(named: "systemRed.click.button"), for: .highlighted)
        cancel.layer.borderWidth = 1.5
        cancel.layer.borderColor = UIColor.black.cgColor
        cancel.layer.cornerRadius = 8
        cancel.layer.masksToBounds = true
        
        alert.addSubview(ok)
        alert.addSubview(cancel)
        
        ok.translatesAutoresizingMaskIntoConstraints = false
        ok.widthAnchor.constraint(equalToConstant: 210).isActive = true
        ok.heightAnchor.constraint(equalToConstant: 35).isActive = true
        ok.topAnchor.constraint(equalTo: pw.layoutMarginsGuide.bottomAnchor, constant: 20).isActive = true
        ok.centerXAnchor.constraint(equalTo: alert.layoutMarginsGuide.centerXAnchor).isActive = true
        
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        cancel.topAnchor.constraint(equalTo: ok.layoutMarginsGuide.bottomAnchor, constant: 15).isActive = true
        cancel.centerXAnchor.constraint(equalTo: alert.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    @objc func closeBtn() {
        self.dismiss(animated: true)
    }
}

// MARK: - 네비게이션 알림창
// 위치 설정 구현 해놓은거 나중에 쓰려고 안지움

extension PUBGAlertViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    @objc func mapViewAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "현재 위치 알림창", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        
        let vc = UIViewController()
        vc.view = mapView
        vc.preferredContentSize.height = 250
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도 최고
        locationManager.requestWhenInUseAuthorization() // 사용자 인증 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        
        mapView.showsUserLocation = true // 현재 위치에 마커로 표시됨
        mapView.userLocation.title = "내 위치"
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isRotateEnabled = false
        
        alert.setValue(vc, forKey: "contentViewController")
        self.present(alert, animated: true)
    }
    
    // 현재 위치 설정
    @objc func myLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta: Double){
        let coordinateLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let locationRegion = MKCoordinateRegion(center: coordinateLocation, span: spanValue)
        mapView.setRegion(locationRegion, animated: false)
        
    }
    
    // 업데이트 되는 위치정보 표시
    @objc func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last // 가장 최근의 위치정보 저장
        myLocation(latitude: (lastLocation?.coordinate.latitude)!, longitude: (lastLocation?.coordinate.longitude)!, delta: 0.005) // delat값이 1보다 작을수록 확대됨. 0.01은 100배확대
    }
}
