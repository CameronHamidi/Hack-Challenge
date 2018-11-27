//
//  PostViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/26/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    var iconView: UIImageView!
    var nameLabel: UILabel!
    var dateLabel: UILabel!
    var statusLabel: UILabel!
    
    var titleLabel: UILabel!
    var descrText: UITextView!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let subTextSize: CGFloat = 12
    let iconSize: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        title = "Post"
        
        //User icon
        iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        //        iconView.contentMode = .scaleAspectFill
        iconView.backgroundColor = .lightGray
        iconView.layer.cornerRadius = iconSize/2
        view.addSubview(iconView)
        
        //User's name
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: subTextSize)
        nameLabel.textColor = .gray
        nameLabel.text = "Name Here" //placeholder - get name data from backend
        view.addSubview(nameLabel)
        
        //Date of when the post was created
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: subTextSize)
        dateLabel.textColor = .gray
        dateLabel.text = "Nov 20" //placeholder - get time and date data from backend
        view.addSubview(dateLabel)
        
        //Open or closed status
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .boldSystemFont(ofSize: subTextSize+2)
        statusLabel.textColor = .white
        statusLabel.backgroundColor = .green
        statusLabel.layer.masksToBounds = true
        statusLabel.layer.cornerRadius = 10
        statusLabel.textAlignment = .center
        statusLabel.text = "Open" //placeholder - get status data from backend
        view.addSubview(statusLabel)
        
        //Title of post
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        titleLabel.text = "Title here" //placeholder - get data from backend
        view.addSubview(titleLabel)
        
        //Created a paragraph style for line spacing (increased readability for users)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        
        //Short description
        descrText = UITextView()
        descrText.translatesAutoresizingMaskIntoConstraints = false
        descrText.font = .systemFont(ofSize: 14) //font size of textview adjusts to fit container
        descrText.textColor = .black
        let txt: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras iaculis pulvinar mi in eleifend. Mauris imperdiet purus id diam tincidunt sodales. Fusce odio lorem, fermentum sit amet mattis et, pharetra vel tortor. Donec sit amet magna vehicula, consectetur leo vitae, tincidunt turpis. Proin imperdiet egestas lorem, sit amet pharetra risus tincidunt a. Praesent eleifend turpis condimentum mauris pulvinar, nec scelerisque nisi efficitur. Praesent volutpat neque eu dapibus lobortis. In ac massa mi. Donec congue ipsum nec ex pellentesque, nec elementum dui pellentesque. Donec congue purus a pulvinar maximus. Integer bibendum ultricies nisi, sed congue dolor fermentum id. Pellentesque sodales rutrum lacus, non viverra diam blandit sit amet.\n\n        Vivamus ultrices, nunc eu imperdiet lobortis, orci enim iaculis tellus, a laoreet eros sem vel arcu. Vivamus et dolor vel nisi fringilla vulputate dictum ut libero. Duis in est et lacus lacinia faucibus vitae non ex. Donec pharetra tristique felis, at ultricies nisl cursus at. Mauris sodales magna eu eros venenatis, ut rutrum massa faucibus. Maecenas porta pharetra dolor in aliquet. Pellentesque id libero ullamcorper mi feugiat semper sed at lorem. Proin bibendum suscipit odio, vitae lobortis metus tempus non. Proin tristique enim quam, at sagittis sapien vulputate a. Duis sit amet magna." //placeholder - get blurb data from backend
        descrText.attributedText = NSAttributedString(string: txt, attributes: attributes)
        view.addSubview(descrText)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            iconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            iconView.heightAnchor.constraint(equalToConstant: iconSize),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: padding/2),
            nameLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding/2),
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            statusLabel.heightAnchor.constraint(equalToConstant: 26),
            statusLabel.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            descrText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descrText.leadingAnchor.constraint(equalTo: iconView.leadingAnchor),
            descrText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            descrText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }

}
