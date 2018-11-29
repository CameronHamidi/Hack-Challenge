//
//  GroupSizeCollectionViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/25/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation
import UIKit

class GroupSizeCollectionViewCell: UICollectionViewCell {
    var sizeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sizeLabel = UILabel()
        sizeLabel.font = UIFont.systemFont(ofSize: 15)
        sizeLabel.textAlignment = .center
        sizeLabel.textColor = .gray
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(sizeLabel)
        contentView.backgroundColor = .lightGray
        
        contentView.layer.cornerRadius = 12.5
    }
    
    func configure(sizeName: String) {
        sizeLabel.text = sizeName
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            sizeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            sizeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sizeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .gray
                sizeLabel.textColor = .black
                print("selected")
            } else {
                contentView.backgroundColor = .lightGray
                sizeLabel.textColor = .gray
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
