//
//  SegueViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {
    // 스토리보드 초기화
    let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SegueRVC")
    
    // MARK: - 화면 전환 방법
    
    @IBAction func automatic(_ sender: UIButton) {
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true)
    }
    @IBAction func popover(_ sender: UIButton) {
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }
    @IBAction func fullScreen(_ sender: UIButton) {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @IBAction func currentContext(_ sender: UIButton) {
        vc.modalPresentationStyle = .currentContext
        self.present(vc, animated: true)
    }
    @IBAction func pageSheet(_ sender: UIButton) {
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true)
    }
    @IBAction func formSheet(_ sender: UIButton) {
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    @IBAction func overFullScreen(_ sender: UIButton) {
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    @IBAction func overCurrentContext(_ sender: UIButton) {
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    // MARK: - 화면 전환 효과
    
    @IBAction func coverVertical(_ sender: UIButton) {
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    @IBAction func crossDissolve(_ sender: UIButton) {
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    @IBAction func flipHorizontal(_ sender: UIButton) {
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: true)
    }
    
    // MARK: - 네비게이션 화면 전환
    
    @IBAction func push(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SegueRVC") as? SegueResultViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - 세그 화면 전환
    
    @IBAction func manual(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ManualSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ManualSegue" {
            NSLog("ManualSegue")
        }
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "화면 전환"
    }
}
