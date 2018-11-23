//
//  ProfileViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class ProfileViewController: UINavigationController {
    
    var avatar: UIImageView!
    var caption: UILabel!
    var name: UILabel!
    var control: UISegmentedControl!
    var segmentedControlContainer: UIView!
    
    let avatarSize: CGFloat = 64
    let padding: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "Profile"
        
        // TODO - revamp to get profile info from backend
        avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.borderWidth = 1
        avatar.layer.masksToBounds = false
        avatar.backgroundColor = .blue
        avatar.layer.cornerRadius = avatar.frame.width/2
        avatar.clipsToBounds = true
        view.addSubview(avatar)
        
        caption = UILabel()
        caption.translatesAutoresizingMaskIntoConstraints = false
        caption.text = "Architect"
        caption.font = .systemFont(ofSize: 18)
        view.addSubview(caption)
        
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "John Doe"
        name.font = .boldSystemFont(ofSize: 32)
        //        name.textAlignment = .right
        view.addSubview(name)
        
        control = UISegmentedControl(items: ["About", "Projects", "Posts"])
        control.translatesAutoresizingMaskIntoConstraints = false
//        control.addTarget(self, action: #selector(sortList), for: .valueChanged)
        view.addSubview(control)
        
        segmentedControlContainer = UIView()
        segmentedControlContainer.backgroundColor = UIColor.white
        view.addSubview(segmentedControlContainer)
//        self.segmentedControlContainer = segmentedControlContainer
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 86),
            avatar.heightAnchor.constraint(equalToConstant: avatarSize),
            avatar.widthAnchor.constraint(equalToConstant: avatarSize)
            ])
        
        NSLayoutConstraint.activate([
            caption.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caption.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 12),
            caption.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: padding),
            name.heightAnchor.constraint(equalToConstant: 36)
            ])
        
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding*2),
            control.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            control.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            control.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        NSLayoutConstraint.activate([
            segmentedControlContainer.topAnchor.constraint(equalTo: control.bottomAnchor, constant: padding),
            segmentedControlContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            segmentedControlContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            segmentedControlContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
            ])
    }
}
