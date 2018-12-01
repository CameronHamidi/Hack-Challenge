//
//  PostDataCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/30/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

enum PostDataType {
    case groupSize
    case developer
    case designer
    case skills
}

class PostDataCollectionViewCell: UICollectionViewCell {
    var icon: UIImageView!
    var label: UILabel!
    var postDataType: PostDataType!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)
        
        label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
    }
    
    override func updateConstraints() {
        switch postDataType! {
        case .groupSize:
            icon.image = UIImage(named: "member")
        case .developer:
            icon.image = UIImage(named: "code")
        case .designer:
            icon.image = UIImage(named: "design")
        default:
            icon.backgroundColor = .black
        }
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 15),
            icon.widthAnchor.constraint(equalToConstant: 15),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 3),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
