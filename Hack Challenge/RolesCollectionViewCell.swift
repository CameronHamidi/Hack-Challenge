//
//  RolesCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/24/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation
import UIKit

class RolesCollectionViewCell: UICollectionViewCell {
    var roleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        roleLabel = UILabel()
        roleLabel.font = UIFont.systemFont(ofSize: 15)
        roleLabel.textAlignment = .center
        roleLabel.textColor = .gray
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(roleLabel)
        contentView.backgroundColor = .lightGray
        
        contentView.layer.cornerRadius = 5
    }
    
    func configure(roleName: String) {
        roleLabel.text = roleName
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            roleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            roleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            roleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .gray
                roleLabel.textColor = .black
                print("selected")
            } else {
                contentView.backgroundColor = .lightGray
                roleLabel.textColor = .gray
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
