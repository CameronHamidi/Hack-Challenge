//
//  ViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/21/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var searchIcon: UIImageView!
    var searchLabel: UILabel!
    
    var searchProjectImageView: UIImageView!
    var searchProjectImageLabel: UILabel!
    var searchProjectButton: UIButton!
    
    var divider1: UIView!
    
    var searchPartnerImageView: UIImageView!
    var searchPartnerLabel: UILabel!
    var searchPartnerButton: UIButton!
    
    var horizontalDivider1: UIView!
    
    var postIcon: UIImageView!
    var postLabel: UILabel!
    
    var pitchProjectImageView: UIImageView!
    var pitchProjectTextButton: UILabel!
    
    var divider2: UIView!
    
    var pitchSelfImageView: UIImageView!
    var pitchSelfLabel: UILabel!
    
    var horizontalDivider2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        searchIcon = UIImageView()
        searchIcon.image = UIImage(named: "miniSearch")
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchIcon)
        
        searchLabel = UILabel()
        searchLabel.text = "Search for"
        searchLabel.textColor = .black
        searchLabel.font = UIFont.systemFont(ofSize: 25)
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchLabel)
        
        searchProjectButton = UIButton()
        searchProjectButton.addTarget(self, action: #selector(showSearchProjectView), for: .touchUpInside)
        searchProjectButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchProjectButton)
        
        searchProjectImageView = UIImageView()
        searchProjectImageView.image = UIImage(named: "project")
        searchProjectImageView.translatesAutoresizingMaskIntoConstraints = false
        searchProjectButton.addSubview(searchProjectImageView)
        
        searchProjectImageLabel = UILabel()
        searchProjectImageLabel.text = "A project"
        searchProjectImageLabel.textColor = .black
        searchProjectImageLabel.font = UIFont.systemFont(ofSize: 17)
        searchProjectImageLabel.translatesAutoresizingMaskIntoConstraints = false
        searchProjectButton.addSubview(searchProjectImageLabel)
        
        divider1 = UIView()
        divider1.backgroundColor = .gray
        divider1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divider1)
        
        searchPartnerButton = UIButton()
        searchPartnerButton.addTarget(self, action: #selector(showSearchPartnerView), for: .touchUpInside)
        searchPartnerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchProjectButton)
        
        searchPartnerImageView = UIImageView()
        searchPartnerImageView.image = UIImage(named: "partner")
        searchPartnerImageView.translatesAutoresizingMaskIntoConstraints = false
        searchPartnerButton.addSubview(searchPartnerImageView)
        
        searchPartnerLabel = UILabel()
        searchPartnerLabel.text = "A Partner"
        searchPartnerLabel.textColor = .black
        searchPartnerLabel.font = UIFont.systemFont(ofSize: 17)
        searchPartnerLabel.translatesAutoresizingMaskIntoConstraints = false
        searchPartnerButton.addSubview(searchPartnerLabel)
        
        horizontalDivider1 = UIView()
        horizontalDivider1.backgroundColor = .gray
        horizontalDivider1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalDivider1)
        
        setupConstraints()
    }
    
    @objc func showSearchProjectView() {
        let viewController = UINavigationController(rootViewController: ProjectSearchViewController())
        present(viewController, animated: true)
    }
    
    @objc func showSearchPartnerView() {
        
    }
    
    @objc func showPostProjectView() {
        
    }
    
    @objc func showPitchSelfView() {
        
    }
    
    @objc func showProfile() {
        let viewController = UINavigationController(rootViewController: ProfileViewController())
        present(viewController, animated: true)
    }
    
    @objc func showNewPitch() {
        let viewController = UINavigationController(rootViewController: NewPitchViewController())
        present(viewController, animated: true)
    }
    
    @objc func showNewRequest() {
        let viewController = UINavigationController(rootViewController: NewRequestViewController())
        present(viewController, animated: true)
    }
    
    @objc func showCreateProfile() {
        let viewController = UINavigationController(rootViewController: CreateProfileViewController())
        present(viewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.heightAnchor.constraint(equalToConstant: 25),
            searchIcon.widthAnchor.constraint(equalToConstant: 25),
            searchIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            searchLabel.centerYAnchor.constraint(equalTo: searchIcon.centerYAnchor),
            searchLabel.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 5)
            ])
        
        NSLayoutConstraint.activate([
            searchProjectButton.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 20),
            searchProjectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchProjectButton.trailingAnchor.constraint(equalTo: divider1.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            searchProjectImageView.topAnchor.constraint(equalTo: searchProjectButton.topAnchor),
            searchProjectImageView.centerXAnchor.constraint(equalTo: searchProjectButton.centerXAnchor),
            searchProjectImageView.heightAnchor.constraint(equalToConstant: 30),
            searchProjectImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            searchProjectImageLabel.topAnchor.constraint(equalTo: searchProjectImageView.bottomAnchor, constant: 5),
            searchProjectImageLabel.leadingAnchor.constraint(equalTo: searchProjectButton.leadingAnchor),
            searchProjectImageLabel.trailingAnchor.constraint(equalTo: searchProjectButton.trailingAnchor),
//            searchProjectImageLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            divider1.widthAnchor.constraint(equalToConstant: 1),
            divider1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider1.topAnchor.constraint(equalTo: searchProjectImageView.topAnchor),
            divider1.bottomAnchor.constraint(equalTo: searchProjectImageLabel.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            searchPartnerButton.topAnchor.constraint(equalTo: searchProjectButton.topAnchor),
            searchPartnerButton.leadingAnchor.constraint(equalTo: divider1.trailingAnchor),
            searchPartnerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            searchPartnerImageView.topAnchor.constraint(equalTo: searchPartnerButton.topAnchor),
            searchPartnerImageView.centerXAnchor.constraint(equalTo: searchPartnerButton.centerXAnchor),
            searchPartnerImageView.heightAnchor.constraint(equalToConstant: 30),
            searchPartnerImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            searchPartnerLabel.topAnchor.constraint(equalTo: searchPartnerImageView.bottomAnchor, constant: 5),
            searchPartnerLabel.leadingAnchor.constraint(equalTo: searchProjectButton.leadingAnchor),
            searchPartnerLabel.trailingAnchor.constraint(equalTo: searchProjectButton.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            horizontalDivider1.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 5),
            horizontalDivider1.heightAnchor.constraint(equalToConstant: 5),
            horizontalDivider1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalDivider1.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    
    }


}

