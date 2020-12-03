//
//  CSStepper.swift
//  MyApps
//
//  Created by TORI on 2020/09/24.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class CSStepper: UIView {
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLbl = UILabel()
    public var value = 0 {
        didSet {
            self.centerLbl.text = String(value)
        }
    }
    
    public var status = UILabel()
    public let one = UIImageView()
    public let two = UIImageView()
    public let three = UIImageView()
    public let four = UIImageView()
    public let five = UIImageView()
    public let six = UIImageView()
    public let seven = UIImageView()
    public let eight = UIImageView()
    public let nine = UIImageView()
    public let ten = UIImageView()
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
        self.bar()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.bar()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - (btnWidth * 2)

        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLbl.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
        
        self.leftBtn.layer.cornerRadius = self.frame.height / 2
        self.rightBtn.layer.cornerRadius = self.frame.height / 2
    }

    public func setup() {
        let borderWidth = CGFloat(1)
        let borderColor = UIColor.cyan.cgColor
        
        self.leftBtn.tag = -10
        self.leftBtn.setTitle("-", for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        self.leftBtn.layer.masksToBounds = true
        self.leftBtn.backgroundColor = .systemBackground
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.leftBtn.addTarget(self, action: #selector(percentage), for: .touchUpInside)
        
        self.rightBtn.tag = 10
        self.rightBtn.setTitle("+", for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        self.rightBtn.layer.masksToBounds = true
        self.rightBtn.backgroundColor = .systemBackground
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(percentage), for: .touchUpInside)
        
        self.centerLbl.text = String(self.value)
        self.centerLbl.font = UIFont.boldSystemFont(ofSize: 20)
        self.centerLbl.textAlignment = .center
        self.centerLbl.backgroundColor = .clear
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(centerLbl)
    }
    
    public func bar() {
        self.status.text = ""
        self.status.textAlignment = .center
        
        let gaugeView = UIView()
        gaugeView.layer.borderWidth = 4
        gaugeView.layer.cornerRadius = 10
        gaugeView.layer.masksToBounds = true
        
        let gaugeTopView = UIView()
        gaugeTopView.layer.borderWidth = 4
        gaugeTopView.layer.cornerRadius = 5
        
        self.addSubview(status)
        self.addSubview(gaugeView)
        self.addSubview(gaugeTopView)
        
        self.status.translatesAutoresizingMaskIntoConstraints = false
        self.status.bottomAnchor.constraint(equalTo: gaugeTopView.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        self.status.centerXAnchor.constraint(equalTo: self.centerLbl.layoutMarginsGuide.centerXAnchor).isActive = true
        
        gaugeView.translatesAutoresizingMaskIntoConstraints = false
        gaugeView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        gaugeView.heightAnchor.constraint(equalToConstant: 285).isActive = true
        gaugeView.bottomAnchor.constraint(equalTo: self.centerLbl.layoutMarginsGuide.topAnchor, constant: -20).isActive = true
        gaugeView.centerXAnchor.constraint(equalTo: self.centerLbl.layoutMarginsGuide.centerXAnchor).isActive = true
        
        gaugeTopView.translatesAutoresizingMaskIntoConstraints = false
        gaugeTopView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gaugeTopView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        gaugeTopView.bottomAnchor.constraint(equalTo: gaugeView.topAnchor, constant: 4).isActive = true
        gaugeTopView.centerXAnchor.constraint(equalTo: gaugeView.centerXAnchor).isActive = true
        
        self.one.backgroundColor = .systemBackground
        self.one.layer.borderWidth = 2
        self.one.layer.cornerRadius = 5
        self.one.layer.masksToBounds = true
        
        self.two.backgroundColor = .systemBackground
        self.two.layer.borderWidth = 2
        self.two.layer.cornerRadius = 5
        self.two.layer.masksToBounds = true
        
        self.three.backgroundColor = .systemBackground
        self.three.layer.borderWidth = 2
        self.three.layer.cornerRadius = 5
        self.three.layer.masksToBounds = true
        
        self.four.backgroundColor = .systemBackground
        self.four.layer.borderWidth = 2
        self.four.layer.cornerRadius = 5
        self.four.layer.masksToBounds = true
        
        self.five.backgroundColor = .systemBackground
        self.five.layer.borderWidth = 2
        self.five.layer.cornerRadius = 5
        self.five.layer.masksToBounds = true
        
        self.six.backgroundColor = .systemBackground
        self.six.layer.borderWidth = 2
        self.six.layer.cornerRadius = 5
        self.six.layer.masksToBounds = true
        
        self.seven.backgroundColor = .systemBackground
        self.seven.layer.borderWidth = 2
        self.seven.layer.cornerRadius = 5
        self.seven.layer.masksToBounds = true
        
        self.eight.backgroundColor = .systemBackground
        self.eight.layer.borderWidth = 2
        self.eight.layer.cornerRadius = 5
        self.eight.layer.masksToBounds = true
        
        self.nine.backgroundColor = .systemBackground
        self.nine.layer.borderWidth = 2
        self.nine.layer.cornerRadius = 5
        self.nine.layer.masksToBounds = true
        
        self.ten.backgroundColor = .systemBackground
        self.ten.layer.borderWidth = 2
        self.ten.layer.cornerRadius = 5
        self.ten.layer.masksToBounds = true
        
        if self.traitCollection.userInterfaceStyle == .light {
            gaugeView.layer.borderColor = UIColor.black.cgColor
            gaugeTopView.layer.borderColor = UIColor.black.cgColor
            self.one.layer.borderColor = UIColor.black.cgColor
            self.two.layer.borderColor = UIColor.black.cgColor
            self.three.layer.borderColor = UIColor.black.cgColor
            self.four.layer.borderColor = UIColor.black.cgColor
            self.five.layer.borderColor = UIColor.black.cgColor
            self.six.layer.borderColor = UIColor.black.cgColor
            self.seven.layer.borderColor = UIColor.black.cgColor
            self.eight.layer.borderColor = UIColor.black.cgColor
            self.nine.layer.borderColor = UIColor.black.cgColor
            self.ten.layer.borderColor = UIColor.black.cgColor
        } else if self.traitCollection.userInterfaceStyle == .dark {
            gaugeView.layer.borderColor = UIColor.white.cgColor
            gaugeTopView.layer.borderColor = UIColor.white.cgColor
            self.one.layer.borderColor = UIColor.white.cgColor
            self.two.layer.borderColor = UIColor.white.cgColor
            self.three.layer.borderColor = UIColor.white.cgColor
            self.four.layer.borderColor = UIColor.white.cgColor
            self.five.layer.borderColor = UIColor.white.cgColor
            self.six.layer.borderColor = UIColor.white.cgColor
            self.seven.layer.borderColor = UIColor.white.cgColor
            self.eight.layer.borderColor = UIColor.white.cgColor
            self.nine.layer.borderColor = UIColor.white.cgColor
            self.ten.layer.borderColor = UIColor.white.cgColor
        }
        
        gaugeView.addSubview(one)
        gaugeView.addSubview(two)
        gaugeView.addSubview(three)
        gaugeView.addSubview(four)
        gaugeView.addSubview(five)
        gaugeView.addSubview(six)
        gaugeView.addSubview(seven)
        gaugeView.addSubview(eight)
        gaugeView.addSubview(nine)
        gaugeView.addSubview(ten)
        
        self.one.translatesAutoresizingMaskIntoConstraints = false
        self.one.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.one.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.one.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.one.bottomAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.bottomAnchor).isActive = true
        
        self.two.translatesAutoresizingMaskIntoConstraints = false
        self.two.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.two.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.two.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.two.bottomAnchor.constraint(equalTo: one.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.three.translatesAutoresizingMaskIntoConstraints = false
        self.three.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.three.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.three.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.three.bottomAnchor.constraint(equalTo: two.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.four.translatesAutoresizingMaskIntoConstraints = false
        self.four.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.four.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.four.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.four.bottomAnchor.constraint(equalTo: three.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.five.translatesAutoresizingMaskIntoConstraints = false
        self.five.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.five.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.five.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.five.bottomAnchor.constraint(equalTo: four.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.six.translatesAutoresizingMaskIntoConstraints = false
        self.six.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.six.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.six.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.six.bottomAnchor.constraint(equalTo: five.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.seven.translatesAutoresizingMaskIntoConstraints = false
        self.seven.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.seven.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.seven.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.seven.bottomAnchor.constraint(equalTo: six.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.eight.translatesAutoresizingMaskIntoConstraints = false
        self.eight.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.eight.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.eight.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.eight.bottomAnchor.constraint(equalTo: seven.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.nine.translatesAutoresizingMaskIntoConstraints = false
        self.nine.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.nine.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.nine.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.nine.bottomAnchor.constraint(equalTo: eight.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
        
        self.ten.translatesAutoresizingMaskIntoConstraints = false
        self.ten.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.ten.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.ten.centerXAnchor.constraint(equalTo: gaugeView.layoutMarginsGuide.centerXAnchor).isActive = true
        self.ten.bottomAnchor.constraint(equalTo: nine.layoutMarginsGuide.topAnchor, constant: -10).isActive = true
    }
    
    @objc public func valueChange(_ sender: UIButton) {
            self.value += sender.tag
    }
    
    @objc public func percentage() {
        switch self.value {
        case 0:
            self.status.text = "방전되었습니다"
            self.one.backgroundColor = .systemBackground
            self.two.backgroundColor = .systemBackground
            self.three.backgroundColor = .systemBackground
            self.four.backgroundColor = .systemBackground
            self.five.backgroundColor = .systemBackground
            self.six.backgroundColor = .systemBackground
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 10:
            self.status.text = "충전이 필요합니다"
            self.one.backgroundColor = .red
            self.two.backgroundColor = .systemBackground
            self.three.backgroundColor = .systemBackground
            self.four.backgroundColor = .systemBackground
            self.five.backgroundColor = .systemBackground
            self.six.backgroundColor = .systemBackground
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 20:
            self.status.text = "배터리가 부족합니다"
            self.one.backgroundColor = .yellow
            self.two.backgroundColor = .yellow
            self.three.backgroundColor = .systemBackground
            self.four.backgroundColor = .systemBackground
            self.five.backgroundColor = .systemBackground
            self.six.backgroundColor = .systemBackground
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 30:
            self.status.text = "배터리가 부족합니다"
            self.one.backgroundColor = .yellow
            self.two.backgroundColor = .yellow
            self.three.backgroundColor = .yellow
            self.four.backgroundColor = .systemBackground
            self.five.backgroundColor = .systemBackground
            self.six.backgroundColor = .systemBackground
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 40:
            self.status.text = ""
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .systemBackground
            self.six.backgroundColor = .systemBackground
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 50:
            self.status.text = ""
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .green
            self.six.backgroundColor = .systemBackground
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 60:
            self.status.text = ""
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .green
            self.six.backgroundColor = .green
            self.seven.backgroundColor = .systemBackground
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 70:
            self.status.text = ""
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .green
            self.six.backgroundColor = .green
            self.seven.backgroundColor = .green
            self.eight.backgroundColor = .systemBackground
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 80:
            self.status.text = ""
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .green
            self.six.backgroundColor = .green
            self.seven.backgroundColor = .green
            self.eight.backgroundColor = .green
            self.nine.backgroundColor = .systemBackground
            self.ten.backgroundColor = .systemBackground
        case 90:
            self.status.text = ""
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .green
            self.six.backgroundColor = .green
            self.seven.backgroundColor = .green
            self.eight.backgroundColor = .green
            self.nine.backgroundColor = .green
            self.ten.backgroundColor = .systemBackground
        case 100:
            self.status.text = "배터리가 모두 충전되었습니다"
            self.one.backgroundColor = .green
            self.two.backgroundColor = .green
            self.three.backgroundColor = .green
            self.four.backgroundColor = .green
            self.five.backgroundColor = .green
            self.six.backgroundColor = .green
            self.seven.backgroundColor = .green
            self.eight.backgroundColor = .green
            self.nine.backgroundColor = .green
            self.ten.backgroundColor = .green
        default:
            break
        }
        
        if self.value > 100 {
            self.value = 100
        } else if self.value < 0 {
            self.value = 0
        }
    }
}
