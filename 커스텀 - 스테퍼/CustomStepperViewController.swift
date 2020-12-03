//
//  CustomStepperViewController.swift
//  MyApps
//
//  Created by TORI on 2020/09/24.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class CustomStepperViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .systemBackground
        let stepper = CSStepper()
        self.view.addSubview(stepper)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stepper.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stepper.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        stepper.centerYAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerYAnchor, constant: 142.5).isActive = true
    }
}
