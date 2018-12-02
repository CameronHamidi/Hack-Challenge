//
//  SkillsCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/22/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation
import UIKit

class SkillsCollectionViewCell: UICollectionViewCell {
    var skillLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        skillLabel = UILabel()
        skillLabel.font = UIFont.systemFont(ofSize: 15)
        skillLabel.textAlignment = .center
        skillLabel.textColor = .gray
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(skillLabel)
//        contentView.backgroundColor = .lightGray
        contentView.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        
        contentView.layer.cornerRadius = 2.5
    }
    
    func configure(skillName: String) {
        skillLabel.text = skillName
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            skillLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skillLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
