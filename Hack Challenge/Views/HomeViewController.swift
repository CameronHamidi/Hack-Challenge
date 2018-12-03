//
//  ViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/21/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var profileButton: UIButton!

    var searchIcon: UIImageView!
    var searchLabel: UILabel!
    
    var searchProjectImageView: UIImageView!
    var searchProjectLabel: UILabel!
    var searchProjectButton: UIButton!
    
    var divider1: UIView!
    
    var searchPartnerImageView: UIImageView!
    var searchPartnerLabel: UILabel!
    var searchPartnerButton: UIButton!
    
    var horizontalDivider1: UIView!
    
    var postIcon: UIImageView!
    var postLabel: UILabel!
    
    var pitchProjectImageView: UIImageView!
    var pitchProjectLabel: UILabel!
    var pitchProjectButton: UIButton!
    
    var divider2: UIView!
    
    var pitchSelfImageView: UIImageView!
    var pitchSelfLabel: UILabel!
    var pitchSelfButton: UIButton!
    
    var horizontalDivider2: UIView!
    
    let padding: CGFloat = 12
    
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
        
        searchProjectLabel = UILabel()
        searchProjectLabel.text = "A project"
        searchProjectLabel.textColor = .black
        searchProjectLabel.textAlignment = .center
        searchProjectLabel.font = UIFont.systemFont(ofSize: 17)
        searchProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        searchProjectButton.addSubview(searchProjectLabel)
        
        divider1 = UIView()
        divider1.backgroundColor = .gray
        divider1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divider1)
        
        searchPartnerButton = UIButton()
        searchPartnerButton.addTarget(self, action: #selector(showSearchPartnerView), for: .touchUpInside)
        searchPartnerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchPartnerButton)
        
        searchPartnerImageView = UIImageView()
        searchPartnerImageView.image = UIImage(named: "partner")
        searchPartnerImageView.translatesAutoresizingMaskIntoConstraints = false
        searchPartnerButton.addSubview(searchPartnerImageView)
        
        searchPartnerLabel = UILabel()
        searchPartnerLabel.text = "A partner"
        searchPartnerLabel.textColor = .black
        searchPartnerLabel.font = UIFont.systemFont(ofSize: 17)
        searchPartnerLabel.translatesAutoresizingMaskIntoConstraints = false
        searchPartnerLabel.textAlignment = .center
        searchPartnerButton.addSubview(searchPartnerLabel)
        
        horizontalDivider1 = UIView()
        horizontalDivider1.backgroundColor = .gray
        horizontalDivider1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalDivider1)
        
        postIcon = UIImageView()
        postIcon.image = UIImage(named: "post")
        postIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postIcon)
        
        postLabel = UILabel()
        postLabel.text = "Post to"
        postLabel.textColor = .black
        postLabel.font = UIFont.systemFont(ofSize: 25)
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postLabel)
        
        pitchProjectButton = UIButton()
        pitchProjectButton.addTarget(self, action: #selector(showPostProjectView), for: .touchUpInside)
        pitchProjectButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pitchProjectButton)
        
        pitchProjectImageView = UIImageView()
        pitchProjectImageView.image = UIImage(named: "team")
        pitchProjectImageView.translatesAutoresizingMaskIntoConstraints = false
        pitchProjectButton.addSubview(pitchProjectImageView)
        
        pitchProjectLabel = UILabel()
        pitchProjectLabel.text = "Request a team"
        pitchProjectLabel.textColor = .black
        pitchProjectLabel.textAlignment = .center
        pitchProjectLabel.font = UIFont.systemFont(ofSize: 17)
        pitchProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        pitchProjectButton.addSubview(pitchProjectLabel)
        
        divider2 = UIView()
        divider2.backgroundColor = .gray
        divider2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divider2)
        
        pitchSelfButton = UIButton()
        pitchSelfButton.addTarget(self, action: #selector(showPitchSelfView), for: .touchUpInside)
        pitchSelfButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pitchSelfButton)
        
        pitchSelfImageView = UIImageView()
        pitchSelfImageView.image = UIImage(named: "pitchBlack")
        pitchSelfImageView.translatesAutoresizingMaskIntoConstraints = false
        pitchSelfButton.addSubview(pitchSelfImageView)
        
        pitchSelfLabel = UILabel()
        pitchSelfLabel.text = "Pitch yourself"
        pitchSelfLabel.textColor = .black
        pitchSelfLabel.font = UIFont.systemFont(ofSize: 17)
        pitchSelfLabel.translatesAutoresizingMaskIntoConstraints = false
        pitchSelfLabel.textAlignment = .center
        pitchSelfButton.addSubview(pitchSelfLabel)
        
        horizontalDivider2 = UIView()
        horizontalDivider2.backgroundColor = .gray
        horizontalDivider2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalDivider2)
        
        profileButton = UIButton()
        profileButton.setTitle("My Profile", for: .normal)
        profileButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = .black
        profileButton.layer.cornerRadius = 10
        profileButton.addTarget(self, action: #selector(showProfileView), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        setupConstraints()
    }
    
    @objc func showProfileView() {
        let viewController = UINavigationController(rootViewController: ProfileViewController())
        present(viewController, animated: true)
    }
    
    @objc func showSearchProjectView() {
        let viewController = UINavigationController(rootViewController: ProjectSearchViewController())
        present(viewController, animated: true)
    }
    
    @objc func showSearchPartnerView() {
        let viewController = UINavigationController(rootViewController: PartnerSearchViewController())
        present(viewController, animated: true)
    }
    
    @objc func showPostProjectView() {
        let viewController = UINavigationController(rootViewController: NewRequestViewController())
        present(viewController, animated: true)
    }
    
    @objc func showPitchSelfView() {
        let viewController = UINavigationController(rootViewController: NewPitchViewController())
        present(viewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.heightAnchor.constraint(equalToConstant: 25),
            searchIcon.widthAnchor.constraint(equalToConstant: 25),
            searchIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
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
            searchProjectLabel.topAnchor.constraint(equalTo: searchProjectImageView.bottomAnchor, constant: 5),
            searchProjectLabel.leadingAnchor.constraint(equalTo: searchProjectButton.leadingAnchor),
            searchProjectLabel.trailingAnchor.constraint(equalTo: searchProjectButton.trailingAnchor),
//            searchProjectLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            divider1.widthAnchor.constraint(equalToConstant: 1),
            divider1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider1.topAnchor.constraint(equalTo: searchProjectImageView.topAnchor),
            divider1.bottomAnchor.constraint(equalTo: searchProjectLabel.bottomAnchor)
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
            searchPartnerLabel.leadingAnchor.constraint(equalTo: searchPartnerButton.leadingAnchor),
            searchPartnerLabel.trailingAnchor.constraint(equalTo: searchPartnerButton.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            horizontalDivider1.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: padding),
            horizontalDivider1.heightAnchor.constraint(equalToConstant: 1),
            horizontalDivider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding*2),
            horizontalDivider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding*2)
            ])
        
        NSLayoutConstraint.activate([
            postIcon.heightAnchor.constraint(equalToConstant: 25),
            postIcon.widthAnchor.constraint(equalToConstant: 25),
            postIcon.topAnchor.constraint(equalTo: horizontalDivider1.bottomAnchor, constant: 20),
            postIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            postLabel.centerYAnchor.constraint(equalTo: postIcon.centerYAnchor),
            postLabel.leadingAnchor.constraint(equalTo: postIcon.trailingAnchor, constant: 5)
            ])
        
        NSLayoutConstraint.activate([
            pitchProjectButton.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 20),
            pitchProjectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pitchProjectButton.trailingAnchor.constraint(equalTo: divider2.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            pitchProjectImageView.topAnchor.constraint(equalTo: pitchProjectButton.topAnchor),
            pitchProjectImageView.centerXAnchor.constraint(equalTo: pitchProjectButton.centerXAnchor),
            pitchProjectImageView.heightAnchor.constraint(equalToConstant: 30),
            pitchProjectImageView.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            pitchProjectLabel.topAnchor.constraint(equalTo: pitchProjectImageView.bottomAnchor, constant: 5),
            pitchProjectLabel.leadingAnchor.constraint(equalTo: pitchProjectButton.leadingAnchor),
            pitchProjectLabel.trailingAnchor.constraint(equalTo: pitchProjectButton.trailingAnchor),
            //            pitchProjectLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            divider2.widthAnchor.constraint(equalToConstant: 1),
            divider2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider2.topAnchor.constraint(equalTo: pitchProjectImageView.topAnchor),
            divider2.bottomAnchor.constraint(equalTo: pitchProjectLabel.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            pitchSelfButton.topAnchor.constraint(equalTo: pitchProjectButton.topAnchor),
            pitchSelfButton.leadingAnchor.constraint(equalTo: divider2.trailingAnchor),
            pitchSelfButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            pitchSelfImageView.topAnchor.constraint(equalTo: pitchSelfButton.topAnchor),
            pitchSelfImageView.centerXAnchor.constraint(equalTo: pitchSelfButton.centerXAnchor),
            pitchSelfImageView.heightAnchor.constraint(equalToConstant: 30),
            pitchSelfImageView.widthAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            pitchSelfLabel.topAnchor.constraint(equalTo: pitchSelfImageView.bottomAnchor, constant: 5),
            pitchSelfLabel.leadingAnchor.constraint(equalTo: pitchSelfButton.leadingAnchor),
            pitchSelfLabel.trailingAnchor.constraint(equalTo: pitchSelfButton.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            horizontalDivider2.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: padding),
            horizontalDivider2.heightAnchor.constraint(equalToConstant: 1),
            horizontalDivider2.leadingAnchor.constraint(equalTo: horizontalDivider2.leadingAnchor),
            horizontalDivider2.trailingAnchor.constraint(equalTo: horizontalDivider2.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: horizontalDivider2.bottomAnchor, constant: 50),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.heightAnchor.constraint(equalToConstant: 35),
            profileButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }


}

