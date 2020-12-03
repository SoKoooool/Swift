//
//  PUBGButtonViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/15.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class PUBGButtonViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.addToBtn()
    }
    
    func addToBtn() {
        let greenBtn = CSButton(type: .system)
        greenBtn.color = .systemGreen
        greenBtn.setTitle("Green Button", for: .normal)
        
        let redBtn = CSButton(type: .custom)
        redBtn.color = .systemRed
        redBtn.style = .halfCircle
        redBtn.setTitle("Circle Red Button", for: .normal)
        redBtn.addTarget(self, action: #selector(clickToBtn(_:)), for: .touchUpInside)
        
        let yellowBtn = CSButton()
        yellowBtn.color = .systemYellow
        yellowBtn.setTitle("Yellow Button", for: .normal)
        yellowBtn.addTarget(self, action: #selector(clickToBtn(_:)), for: .touchUpInside)
        
        let pinkBtn = CSButton()
        pinkBtn.color = .systemPink
        pinkBtn.style = .halfCircle
        pinkBtn.setTitle("Pink Button", for: .normal)
        
        let blueBtn = CSButton()
        blueBtn.color = .systemBlue
        blueBtn.style = .circle
        blueBtn.titleLabel?.numberOfLines = 2
        blueBtn.setTitle("Blue Button", for: .normal)
        
        self.view.addSubview(greenBtn)
        self.view.addSubview(redBtn)
        self.view.addSubview(yellowBtn)
        self.view.addSubview(pinkBtn)
        self.view.addSubview(blueBtn)
        
        greenBtn.translatesAutoresizingMaskIntoConstraints = false
        greenBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        greenBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        greenBtn.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        greenBtn.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        redBtn.translatesAutoresizingMaskIntoConstraints = false
        redBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        redBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        redBtn.topAnchor.constraint(equalTo: greenBtn.layoutMarginsGuide.bottomAnchor, constant: 40).isActive = true
        redBtn.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        yellowBtn.translatesAutoresizingMaskIntoConstraints = false
        yellowBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        yellowBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        yellowBtn.topAnchor.constraint(equalTo: redBtn.layoutMarginsGuide.bottomAnchor, constant: 40).isActive = true
        yellowBtn.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        pinkBtn.translatesAutoresizingMaskIntoConstraints = false
        pinkBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pinkBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        pinkBtn.topAnchor.constraint(equalTo: yellowBtn.layoutMarginsGuide.bottomAnchor, constant: 40).isActive = true
        pinkBtn.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        blueBtn.translatesAutoresizingMaskIntoConstraints = false
        blueBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        blueBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        blueBtn.topAnchor.constraint(equalTo: pinkBtn.layoutMarginsGuide.bottomAnchor, constant: 40).isActive = true
        blueBtn.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
    }
    
    @objc func clickToBtn(_ sender: CSButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) Click", for: .normal)
    }
}
