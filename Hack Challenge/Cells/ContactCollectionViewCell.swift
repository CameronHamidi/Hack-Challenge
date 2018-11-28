//
//  ContactCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/28/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

enum ContactEnum {
    case facebook
    case phone
    case email
}

class ContactCollectionViewCell: UICollectionViewCell {
    var icon: UIImageView!
    var label: UILabel!
    var contactType: ContactEnum!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)
        
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        contentView.addSubview(label)
     
        updateConstraints()
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 10),
            icon.widthAnchor.constraint(equalToConstant: 10),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor)
            ])
    }
    
    func performContact() {
        switch contactType! {
        case .facebook:
            //open facebook
            print("open facebook")
        case .phone:
            UIApplication.shared.open(URL(string: "sms:" + label.text!)!, options: [:], completionHandler: nil)
        case .email:
            UIApplication.shared.open(URL(string: "email:" + label.text!)!, options: [:], completionHandler: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
