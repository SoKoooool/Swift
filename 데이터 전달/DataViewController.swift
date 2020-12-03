//
//  DataViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    @IBOutlet var emailText: UILabel!
    @IBOutlet var updateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    @IBAction func edit(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataFVC") as? DataFormViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onRecv(_ sender: UIButton) {
        if let email = self.paramEmail {
            self.emailText.text = self.paramEmail == "" ? "입력되지않음" : email
        }
        if let update = self.paramUpdate {
            if update == true {
                self.updateText.text = "켜짐"
                self.updateText.textColor = .systemBlue
            } else {
                self.updateText.text = "꺼짐"
                self.updateText.textColor = .systemRed
            }
        }
        if let interval = self.paramInterval {
            self.intervalText.text = "\(Int(interval))분마다"
        }
    }
    
    @IBAction func loadAD(_ sender: UIButton) {
        guard let ad = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        if let email = ad.paramEmail {
            self.emailText.text = email == "" ? "입력되지않음" : email
        }
        if let update = ad.paramUpdate {
            if update == true {
                self.updateText.text = "켜짐"
                self.updateText.textColor = .systemBlue
            } else {
                self.updateText.text = "꺼짐"
                self.updateText.textColor = .systemRed
            }
        }
        if let interval = ad.paramInterval {
            self.intervalText.text = "\(Int(interval))분마다"
        }
    }
    
    @IBAction func loadUD(_ sender: UIButton) {
        let ud = UserDefaults.standard
        if let email = ud.string(forKey: "email") {
            self.emailText.text = email == "" ? "입력되지않음" : email
        }
        let update = ud.bool(forKey: "update")
        if update == true {
            self.updateText.text = "켜짐"
            self.updateText.textColor = .systemBlue
        } else {
            self.updateText.text = "꺼짐"
            self.updateText.textColor = .systemRed
        }
        let interval = ud.double(forKey: "interval")
        self.intervalText.text = "\(Int(interval))분마다"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.title = "데이터 수신"
    }
}
