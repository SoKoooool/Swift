//
//  AlertViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit
import UserNotifications

class AlertViewController: UIViewController {
    @IBOutlet var alertText: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBAction func popup(_ sender: UIButton) {
        let alert = UIAlertController(title: "팝업 알림창", message: "화면 중앙에 띄워지는 알림창", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.alertText.font = UIFont.boldSystemFont(ofSize: 17)
            self.alertText.textColor = .black
            self.alertText.text = "취소"
        }
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.alertText.font = UIFont.systemFont(ofSize: 17)
            self.alertText.textColor = .black
            self.alertText.text = "확인"
        }
        let warning = UIAlertAction(title: "경고", style: .destructive) { (_) in
            self.alertText.font = UIFont.systemFont(ofSize: 17)
            self.alertText.textColor = .systemRed
            self.alertText.text = "경고"
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(warning)
        self.present(alert, animated: true)
    }
    
    @IBAction func actionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "액션시트 알림창", message: "화면 하단에서 올라오는 알림창", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.alertText.font = UIFont.boldSystemFont(ofSize: 17)
            self.alertText.textColor = .black
            self.alertText.text = "취소"
        }
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.alertText.font = UIFont.systemFont(ofSize: 17)
            self.alertText.textColor = .black
            self.alertText.text = "확인"
        }
        let warning = UIAlertAction(title: "경고", style: .destructive) { (_) in
            self.alertText.font = UIFont.systemFont(ofSize: 17)
            self.alertText.textColor = .systemRed
            self.alertText.text = "경고"
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(warning)
        self.present(alert, animated: true)
    }
    
    @IBAction func textField(_ sender: UIButton) {
        let alert = UIAlertController(title: "텍스트필드 알림창", message: "아이디와 비밀번호 입력시 필요한 텍스트필드", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            if alert.textFields?[0].text?.isEmpty == true {
                // 아이디를 미입력시
                let idAlert = UIAlertController(title: nil, message: "아이디가 입력되지 않았습니다", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    self.present(alert, animated: true)
                }
                idAlert.addAction(ok)
                self.present(idAlert, animated: true)
            } else if alert.textFields?[1].text?.isEmpty == true {
                // 비밀번호 미입력시
                let pwAlert = UIAlertController(title: nil, message: "비밀번호가 입력되지 않았습니다", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    self.present(alert, animated: true)
                }
                pwAlert.addAction(ok)
                self.present(pwAlert, animated: true)
            } else {
                // 둘 다 입력했을때
                self.alertText.text = "아이디: \((alert.textFields?[0].text)!), 비밀번호: \((alert.textFields?[1].text)!)"
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "아이디"
        })
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        self.present(alert, animated: true)
    }
    
    @IBAction func notiRequest(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            // iOS 10 이상 = UserNotification
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, e) in }
            notiCenter.delegate = self
        } else {
            // iOS 9 이하 = LocalNotification
            let application = UIApplication.shared
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
        }
    }
    
    @IBAction func resetRequest(_ sender: UIButton) {
        // 알림 권한 상태 초기화 시키는 버튼 구현
    }
    
    @IBAction func notiMsg(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            // iOS 10 이상 = UserNotification
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                if settings.authorizationStatus == .authorized {
                    // 알림 컨텐츠
                    let content = UNMutableNotificationContent()
                    content.badge = 999
                    content.title = "알림"
                    content.subtitle = "알림 메세지입니다"
                    content.body = "확인하지 않은 메세지가 \((content.badge)!)개 있습니다"
                    content.sound = .default
                    content.userInfo = ["name" : "SoKool"]
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.01, repeats: false)
                    let request = UNNotificationRequest(identifier: "resign", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                } else {
                    let alert = UIAlertController(title: nil, message: "알림 권한 미동의 상태", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    self.present(alert, animated: true)
                }
            }
        } else {
            // iOS 9 이하 = LocalNotification
            let application = UIApplication.shared
            let setting = application.currentUserNotificationSettings
            guard setting?.types != Optional.none else {
                print("Can't Schedule")
                return
            }
            // 알림 컨텐츠
            let content = UILocalNotification()
            content.fireDate = Date(timeIntervalSinceNow: 10)
            content.timeZone = TimeZone.autoupdatingCurrent
            content.alertBody = ""
            content.alertAction = ""
            content.applicationIconBadgeNumber = 1
            content.soundName = UILocalNotificationDefaultSoundName
            content.userInfo = ["name" : "resign"]
            
            application.scheduleLocalNotification(content)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            // iOS 10 이상 = UserNotification
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                if settings.authorizationStatus == .authorized {
                    // 알림 컨텐츠
                    DispatchQueue.main.async { // 백그라운드 실행큐
                        let content = UNMutableNotificationContent()
                        content.title = "알림 메세지"
                        content.body = ""
                        content.sound = .default
                        
                        #warning("현재 시간 이전으로 설정하면 에러남")
                        let time = self.datePicker.date.timeIntervalSinceNow
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        let request = UNNotificationRequest(identifier: "alarm", content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request) { (_) in
                            DispatchQueue.main.async {
                                let date = self.datePicker.date.addingTimeInterval(9*60*60)
                                let message = "\(date)에 알림이 등록되었습니다"
                                let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "확인", style: .default)
                                alert.addAction(ok)
                                self.present(alert, animated: true)
                            }
                        }
                    }
                } else {
                    let alert = UIAlertController(title: nil, message: "알림 권한 미동의 상태", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    self.present(alert, animated: true)
                }
            }
        } else {
            // iOS 9 이하 = LocalNotification
            let application = UIApplication.shared
            let setting = application.currentUserNotificationSettings
            guard setting?.types != Optional.none else {
                print("Can't Schedule")
                return
            }
            // 알림 컨텐츠
            let content = UILocalNotification()
            content.fireDate = Date(timeIntervalSinceNow: 10)
            content.timeZone = TimeZone.autoupdatingCurrent
            content.alertBody = ""
            content.alertAction = ""
            content.applicationIconBadgeNumber = 1
            content.soundName = UILocalNotificationDefaultSoundName
            content.userInfo = ["name" : "alarm"]
            
            application.scheduleLocalNotification(content)
        }
    }
}

// MARK: - iOS 10 이상 알림 설정

extension AlertViewController: UNUserNotificationCenterDelegate {
    // // iOS 10 이상 앱이 활성화 상태일때 뜨는 알림
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "resign" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // // iOS 10 이상 알림 메세지 클릭했을때
        if response.notification.request.identifier == "resign" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler()
    }
}

// MARK: - iOS 9 이하 알림 설정

extension AlertViewController: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // iOS 9 이하 알림 메세지 클릭했을때
        if #available(iOS 10.0, *) {} else {
            if let localNoti = launchOptions?[.localNotification] as? UILocalNotification {
                print((localNoti.userInfo?["name"])!)
            }
        }
        return true
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        print((notification.userInfo?["name"])!)
        if application.applicationState == .active {
            // iOS 9 이하 앱이 활성화 상태일때 실행구문
        } else if application.applicationState == .inactive {
            // iOS 9 이하 앱이 비활성화 상태일때 실행구문
        }
    }
}
