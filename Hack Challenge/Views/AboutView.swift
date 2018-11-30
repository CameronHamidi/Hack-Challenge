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
    case skills
}

class AboutView: UIView {

    var icon: UIImageView!
    var title: UILabel!
    var editButton: UIImageView!
    var primaryRoleIcon: UIImageView?
    var mainTextView: UITextView!
    var secondaryTextView: UITextView?
    var viewType: AboutViewType!
    
    init(frame: CGRect, viewType: AboutViewType) {
        super.init(frame: frame)
        
        self.viewType = viewType
        
        self.backgroundColor = .gray
        
        icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(icon)
        icon.backgroundColor = .blue
        
        title = UILabel()
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 13)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        editButton = UIImageView()
        editButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(editButton)
        editButton.backgroundColor = .red
        
        mainTextView = UITextView()
        mainTextView.isEditable = false
        mainTextView.isSelectable = false
        mainTextView.textColor = .black
        mainTextView.font = UIFont.systemFont(ofSize: 14)
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mainTextView)
        
        switch viewType {
        case .gradYear:
            title.text = "Graduation Year"
        case .majors:
            title.text = "Majors/Minors"
        case .roles:
            title.text = "Roles"
        case .skills:
            title.text = "Skills"
            secondaryTextView = UITextView()
            secondaryTextView!.isEditable = false
            secondaryTextView!.isSelectable = false
            secondaryTextView!.textColor = .black
            secondaryTextView!.font = UIFont.systemFont(ofSize: 14)
            secondaryTextView!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(secondaryTextView!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override  func updateConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            icon.heightAnchor.constraint(equalToConstant: 15),
            icon.widthAnchor.constraint(equalToConstant: 15),
            ])
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 15),
            editButton.widthAnchor.constraint(equalToConstant: 15),
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            mainTextView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            mainTextView.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            mainTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
            ])
        
        switch self.viewType! {
        case .skills:
            NSLayoutConstraint.activate([
                (secondaryTextView?.topAnchor.constraint(equalTo: mainTextView.topAnchor))!,
                (secondaryTextView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15))!,
                (secondaryTextView?.widthAnchor.constraint(equalToConstant: self.frame.width - 15))!,
                mainTextView.trailingAnchor.constraint(equalTo: secondaryTextView!.leadingAnchor, constant: 15)
                ])
        default:
            NSLayoutConstraint.activate([
                mainTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15)
                ])
        }
        
        super.updateConstraints()
    }
}
