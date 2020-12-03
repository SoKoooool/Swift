//
//  DataFormViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class DataFormViewController: UIViewController {
    @IBOutlet var updateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    @IBOutlet var email: UITextField!
    @IBOutlet var update: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBAction func update(_ sender: UISwitch) {
        self.updateText.text = sender.isOn == true ? "갱신함" : "갱신하지않음"
    }
    
    @IBAction func interval(_ sender: UIStepper) {
        self.intervalText.text = "\(Int(interval.value))분마다"
    }
    
    #warning("dismiss 로 복귀하면 메모리 해제되면서 값이 직접적으로 안넘어감")
    @IBAction func onSubmit(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataVC") as? DataViewController else {
            return
        }
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.update.isOn
        vc.paramInterval = self.interval.value
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveAD(_ sender: UIButton) {
        guard let ad = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        ad.paramEmail = self.email.text
        ad.paramUpdate = self.update.isOn
        ad.paramInterval = self.interval.value
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveUD(_ sender: UIButton) {
        let ud = UserDefaults.standard
        ud.set(self.email.text, forKey: "email")
        ud.set(self.update.isOn, forKey: "update")
        ud.set(self.interval.value, forKey: "interval")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "데이터 전달"
    }
}
