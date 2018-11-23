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
    
    var segControl: UISegmentedControl!
    var containerView: UIView!
    var aboutContainer: UIView!
    var projectsContainer: UIView!
    var postsContainer: UIView!
//    var segmentedControlContainer: UIView!
    
    let avatarSize: CGFloat = 64
    let padding: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
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
        
        segControl = UISegmentedControl(items: ["About", "Projects", "Posts"])
        segControl.translatesAutoresizingMaskIntoConstraints = false
//        control.addTarget(self, action: #selector(sortList), for: .valueChanged)
        segControl.addTarget(self, action: #selector(self.showComponents(sender:)), for: .valueChanged)
        segControl.backgroundColor = .white
        view.addSubview(segControl)
        
        // add container
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "Second")
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(controller.view)
        
        controller.didMove(toParent: self)
        
        //Segmented subviews
//        aboutContainer = UIView()
//        aboutContainer.translatesAutoresizingMaskIntoConstraints = false
//        aboutContainer.backgroundColor = .red
//        view.addSubview(aboutContainer)
//
//        projectsContainer = UIView()
//        projectsContainer.translatesAutoresizingMaskIntoConstraints = false
//        projectsContainer.backgroundColor = .green
//        view.addSubview(projectsContainer)
//
//        postsContainer = UIView()
//        postsContainer.translatesAutoresizingMaskIntoConstraints = false
//        postsContainer.backgroundColor = .blue
//        view.addSubview(postsContainer)
        
//        segmentedControlContainer = UIView()
//        segmentedControlContainer.backgroundColor = UIColor.white
//        view.addSubview(segmentedControlContainer)
//        self.segmentedControlContainer = segmentedControlContainer
        
        setupConstraints()
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
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
            segControl.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding*2),
            segControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            segControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            segControl.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
            ])
        
//        NSLayoutConstraint.activate([
//            segmentedControlContainer.topAnchor.constraint(equalTo: control.bottomAnchor, constant: padding),
//            segmentedControlContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            segmentedControlContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            segmentedControlContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
        
//        NSLayoutConstraint.activate([
//            aboutContainer.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
//            aboutContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            aboutContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            aboutContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
//
//        NSLayoutConstraint.activate([
//            projectsContainer.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
//            projectsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            projectsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            projectsContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
//
//        NSLayoutConstraint.activate([
//            postsContainer.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
//            postsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            postsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            postsContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
    }
    
    @IBAction func showComponents(sender: AnyObject) {
        if(sender.selectedSegmentIndex == 0) {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 1
                self.projectsContainer.alpha = 0
                self.postsContainer.alpha = 0
                })
        }
        else if(sender.selectedSegmentIndex == 1) {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 0
                self.projectsContainer.alpha = 1
                self.postsContainer.alpha = 0
            })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 0
                self.projectsContainer.alpha = 0
                self.postsContainer.alpha = 1
            })
        }
    }
}
