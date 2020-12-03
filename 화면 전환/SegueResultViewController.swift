//
//  SegueResultViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class SegueResultViewController: UIViewController {
    @IBAction func dismiss(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func pop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "화면 복귀"
    }
}
