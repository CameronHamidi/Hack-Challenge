//
//  InfoViewsTableViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/29/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class InfoViewsTableViewCell: UITableViewCell {

    var icon: UIImageView!
    var infoLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        
        icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = .black
        contentView.addSubview(icon)
        
        infoLabel = UILabel()
        infoLabel.font = UIFont.systemFont(ofSize: 15)
        infoLabel.textColor = .black
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoLabel)
    }
    
    func configure(for text: String) {
        infoLabel.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 15),
            icon.widthAnchor.constraint(equalToConstant: 15),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
            ])
        
        
        
        NSLayoutConstraint.activate([
//            infoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//            infoLabel.trailingAnchor.constraint(equalTo: self.accessoryView!.leadingAnchor, constant: 5)
            ])
        
        super.updateConstraints()
    }

}
