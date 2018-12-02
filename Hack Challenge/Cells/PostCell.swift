//
//  PostCell.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/25/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    var iconView: UIImageView!
    var nameLabel: UILabel!
    var dateLabel: UILabel!
    
    var titleLabel: UILabel!
    var blurbText: UILabel!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let subTextSize: CGFloat = 12
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //User icon
        iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
//        iconView.contentMode = .scaleAspectFill
        iconView.backgroundColor = .lightGray
        iconView.layer.cornerRadius = 25
        addSubview(iconView)
        
        //User's name
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: subTextSize)
        nameLabel.textColor = .gray
//        nameLabel.text = "Name Here" //placeholder - get name data from backend
        addSubview(nameLabel)
        
        //Date of when the post was created
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: subTextSize)
        dateLabel.textColor = .gray
//        dateLabel.text = "Nov 20" //placeholder - get name data from backend
        addSubview(dateLabel)
        
        //Title of post
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
//        titleLabel.text = "Title here" //placeholder - get name data from backend
        addSubview(titleLabel)
        
        //Short description
        blurbText = UILabel()
        blurbText.translatesAutoresizingMaskIntoConstraints = false
        blurbText.font = .systemFont(ofSize: 14)
        blurbText.textColor = .black
//        blurbText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc" //placeholder - get name data from backend
        addSubview(blurbText)
        
        setConstraints()
    }
    
    func configure(for post: Post) {
//        iconView.image = post.icon
//        nameLabel.text = post.name
//        dateLabel.text = post.date
//        titleLabel.text = post.title
//        blurbText.text = post.blurb
    }
    
    func setConstraints() {
        iconView.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        iconView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: padding/2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true

        dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding/2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: padding).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: iconView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        blurbText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding).isActive = true
        blurbText.leadingAnchor.constraint(equalTo: iconView.leadingAnchor).isActive = true
        blurbText.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        blurbText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
