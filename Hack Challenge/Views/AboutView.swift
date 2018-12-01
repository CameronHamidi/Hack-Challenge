//
//  AboutView.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/30/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

enum AboutViewType {
    case gradYear
    case majors
    case roles
    case courses
    case skills
}

class AboutView: UIView {

    var icon: UIImageView!
    var title: UILabel!
//    var editButton: UIImageView!
    var primaryRoleIcon: UIImageView?
    var mainLabel: UILabel!
    var secondaryLabel: UILabel?
    var viewType: AboutViewType!
    
    init(frame: CGRect, viewType: AboutViewType) {
        super.init(frame: frame)
        
        self.viewType = viewType
        
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 5
        
        icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(icon)
        icon.backgroundColor = .blue
        
        title = UILabel()
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 13)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
//        editButton = UIImageView()
//        editButton.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(editButton)
//        editButton.backgroundColor = .red
        
        mainLabel = UILabel()
//        mainLabel.isEditable = false
//        mainLabel.isSelectable = false
        mainLabel.textColor = .black
        mainLabel.font = UIFont.systemFont(ofSize: 14)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.numberOfLines = 0
        self.addSubview(mainLabel)
        
        switch viewType {
        case .gradYear:
            title.text = "Graduation Year"
        case .majors:
            title.text = "Majors/Minors"
        case .roles:
            title.text = "Roles"
        case .courses:
            title.text = "Courses"
            secondaryLabel = UILabel()
            secondaryLabel!.textColor = .black
            secondaryLabel!.numberOfLines = 0
            secondaryLabel!.font = UIFont.systemFont(ofSize: 14)
            secondaryLabel!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(secondaryLabel!)
        case .skills:
            title.text = "Skills"
            secondaryLabel = UILabel()
            secondaryLabel!.textColor = .black
            secondaryLabel!.numberOfLines = 0
            secondaryLabel!.font = UIFont.systemFont(ofSize: 14)
            secondaryLabel!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(secondaryLabel!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override  func updateConstraints() {
        let attributedMain = NSMutableAttributedString(string: mainLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedMain.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedMain.length))
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            icon.heightAnchor.constraint(equalToConstant: 15),
            icon.widthAnchor.constraint(equalToConstant: 15),
            ])
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
            ])
        
//        NSLayoutConstraint.activate([
//            editButton.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
//            editButton.heightAnchor.constraint(equalToConstant: 15),
//            editButton.widthAnchor.constraint(equalToConstant: 15),
//            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
//            ])
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            mainLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
            ])
        
        mainLabel.sizeToFit()
        
//        let fixedWidth = mainLabel.frame.size.width
//        let newSize = mainLabel.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        mainLabel.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
        switch self.viewType! {
        case .skills:
            NSLayoutConstraint.activate([
                (secondaryLabel?.topAnchor.constraint(equalTo: mainLabel.topAnchor))!,
                (secondaryLabel?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15))!,
                (secondaryLabel?.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 15))!,
                mainLabel.trailingAnchor.constraint(equalTo: secondaryLabel!.leadingAnchor, constant: -15)
                ])
            var attributedSecondary = NSMutableAttributedString(string: secondaryLabel!.text!)
            attributedSecondary.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedSecondary.length))
        case .courses:
            NSLayoutConstraint.activate([
                (secondaryLabel?.topAnchor.constraint(equalTo: mainLabel.topAnchor))!,
                (secondaryLabel?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15))!,
                (secondaryLabel?.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 15))!,
                mainLabel.trailingAnchor.constraint(equalTo: secondaryLabel!.leadingAnchor, constant: -15)
                ])
            var attributedSecondary = NSMutableAttributedString(string: secondaryLabel!.text!)
            attributedSecondary.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedSecondary.length))
        default:
            NSLayoutConstraint.activate([
                mainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
                ])
        }
        
        super.updateConstraints()
    }
}
