//
//  CustomEnterCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation
import UIKit

class CustomEnterCollectionViewCell: UICollectionViewCell {
    var customTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customTextField = UITextField()
        customTextField.font = UIFont.systemFont(ofSize: 12)
        customTextField.textAlignment = .center
        customTextField.textColor = .black
        customTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customTextField)
        contentView.backgroundColor = .white
    }
    
    func configure(roleName: String) {
        customTextField.text = roleName
        
        NSLayoutConstraint.activate([
            customTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            customTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            customTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .blue
                customTextField.textColor = .white
            } else {
                contentView.backgroundColor = .white
                customTextField.textColor = .black
            }
            print("didset")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
