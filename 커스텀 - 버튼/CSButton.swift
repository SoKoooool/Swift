//
//  CSButton.swift
//  MyApps
//
//  Created by TORI on 2020/09/15.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class CSButton: UIButton {
    #warning("초기화 메소드 하나도 모르겠음")
    // required 하위 클래스가 이 초기화를 반드시 선언해야함
    // init(coder:) 스토리보드에서 객체를 초기화할때 호출되는 메소드
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 수퍼 클래스의 지정 초기화를 오버라이드
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Designnated init(지정 초기화)
    init() {
        super.init(frame: .zero)
    }
    
    // convenience init(편의 초기화) - 부분 초기화
    convenience init(color: CSButtonColor) {
        self.init()
        
        switch color {
        case .systemGreen:
            self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
            self.titleLabel?.textAlignment = .center
            self.setTitleColor(.black, for: .normal)
            self.setBackgroundImage(UIImage(named: "systemGreen.button"), for: .normal)
            self.setBackgroundImage(UIImage(named: "systemGreen.click.button"), for: .highlighted)
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.systemGreen.cgColor
        case .systemRed:
            self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
            self.titleLabel?.textAlignment = .center
            self.setTitleColor(.black, for: .normal)
            self.setBackgroundImage(UIImage(named: "systemRed.button"), for: .normal)
            self.setBackgroundImage(UIImage(named: "systemRed.click.button"), for: .highlighted)
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.systemRed.cgColor
        case .systemPink:
            self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
            self.titleLabel?.textAlignment = .center
            self.setTitleColor(.black, for: .normal)
            self.setBackgroundImage(UIImage(named: "systemPink.button"), for: .normal)
            self.setBackgroundImage(UIImage(named: "systemPink.click.button"), for: .highlighted)
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.systemPink.cgColor
        case .systemYellow:
            self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
            self.titleLabel?.textAlignment = .center
            self.setTitleColor(.black, for: .normal)
            self.setBackgroundImage(UIImage(named: "systemYellow.button"), for: .normal)
            self.setBackgroundImage(UIImage(named: "systemYellow.click.button"), for: .highlighted)
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.systemYellow.cgColor
        case .systemBlue:
            self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
            self.titleLabel?.textAlignment = .center
            self.setTitleColor(.black, for: .normal)
            self.setBackgroundImage(UIImage(named: "systemBlue.button"), for: .normal)
            self.setBackgroundImage(UIImage(named: "systemBlue.click.button"), for: .highlighted)
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    var color: CSButtonColor! {
        didSet {
            switch color {
            case .systemGreen:
                self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
                self.titleLabel?.textAlignment = .center
                self.setTitleColor(.black, for: .normal)
                self.setBackgroundImage(UIImage(named: "systemGreen.button"), for: .normal)
                self.setBackgroundImage(UIImage(named: "systemGreen.click.button"), for: .highlighted)
                self.layer.borderWidth = 1.5
                self.layer.borderColor = UIColor.systemGreen.cgColor
            case .systemRed:
                self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
                self.titleLabel?.textAlignment = .center
                self.setTitleColor(.black, for: .normal)
                self.setBackgroundImage(UIImage(named: "systemRed.button"), for: .normal)
                self.setBackgroundImage(UIImage(named: "systemRed.click.button"), for: .highlighted)
                self.layer.borderWidth = 1.5
                self.layer.borderColor = UIColor.systemRed.cgColor
            case .systemPink:
                self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
                self.titleLabel?.textAlignment = .center
                self.setTitleColor(.black, for: .normal)
                self.setBackgroundImage(UIImage(named: "systemPink.button"), for: .normal)
                self.setBackgroundImage(UIImage(named: "systemPink.click.button"), for: .highlighted)
                self.layer.borderWidth = 1.5
                self.layer.borderColor = UIColor.systemPink.cgColor
            case .systemYellow:
                self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
                self.titleLabel?.textAlignment = .center
                self.setTitleColor(.black, for: .normal)
                self.setBackgroundImage(UIImage(named: "systemYellow.button"), for: .normal)
                self.setBackgroundImage(UIImage(named: "systemYellow.click.button"), for: .highlighted)
                self.layer.borderWidth = 1.5
                self.layer.borderColor = UIColor.systemYellow.cgColor
            case .systemBlue:
                self.titleLabel?.font = UIFont(name: "HeadlinerNo.45", size: 20)
                self.titleLabel?.textAlignment = .center
                self.setTitleColor(.black, for: .normal)
                self.setBackgroundImage(UIImage(named: "systemBlue.button"), for: .normal)
                self.setBackgroundImage(UIImage(named: "systemBlue.click.button"), for: .highlighted)
                self.layer.borderWidth = 1.5
                self.layer.borderColor = UIColor.systemBlue.cgColor
            case .none:
                break
            }
        }
    }
    
    var style: CSButtonStyle! {
        didSet {
            switch style {
            case .halfCircle:
                self.layer.cornerRadius = 17.5
                self.layer.masksToBounds = true
            case .circle:
                self.layer.cornerRadius = 30
                self.layer.masksToBounds = true
            default:
                break
            }
        }
    }
}

enum CSButtonColor {
    case systemGreen
    case systemRed
    case systemPink
    case systemYellow
    case systemBlue
}

enum CSButtonStyle {
    case halfCircle
    case circle
}
