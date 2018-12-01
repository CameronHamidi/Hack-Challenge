//
//  ViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/21/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var searchProjectsButton: UIButton!
    var profileButton: UIButton!
    var newPitchButton: UIButton!
    var newRequestButton: UIButton!
    var createProfileButton: UIButton! //for testing purposes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        searchProjectsButton = UIButton()
        searchProjectsButton.setTitle("Search projects", for: .normal)
        searchProjectsButton.translatesAutoresizingMaskIntoConstraints = false
        searchProjectsButton.setTitleColor(.black, for: .normal)
        searchProjectsButton.addTarget(self, action: #selector(showSearchProjectView), for: .touchUpInside)
        view.addSubview(searchProjectsButton)
        
        profileButton = UIButton()
        profileButton.setTitle("Show profile", for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setTitleColor(.black, for: .normal)
        profileButton.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
        view.addSubview(profileButton)
        
        newPitchButton = UIButton()
        newPitchButton.setTitle("New pitch", for: .normal)
        newPitchButton.translatesAutoresizingMaskIntoConstraints = false
        newPitchButton.setTitleColor(.black, for: .normal)
        newPitchButton.addTarget(self, action: #selector(showNewPitch), for: .touchUpInside)
        view.addSubview(newPitchButton)
        
        newRequestButton = UIButton()
        newRequestButton.setTitle("New request", for: .normal)
        newRequestButton.translatesAutoresizingMaskIntoConstraints = false
        newRequestButton.setTitleColor(.black, for: .normal)
        newRequestButton.addTarget(self, action: #selector(showNewRequest), for: .touchUpInside)
        view.addSubview(newRequestButton)
        
        createProfileButton = UIButton()
        createProfileButton.setTitle("Create New Profile", for: .normal)
        createProfileButton.translatesAutoresizingMaskIntoConstraints = false
        createProfileButton.setTitleColor(.black, for: .normal)
        createProfileButton.addTarget(self, action: #selector(showCreateProfile), for: .touchUpInside)
        view.addSubview(createProfileButton)
        
        setupConstraints()
    }
    
    @objc func showSearchProjectView() {
        let viewController = UINavigationController(rootViewController: ProjectSearchViewController())
        present(viewController, animated: true)
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
//            searchProjectsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchProjectsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.topAnchor.constraint(equalTo: searchProjectsButton.bottomAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            newPitchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPitchButton.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            newRequestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newRequestButton.topAnchor.constraint(equalTo: newPitchButton.bottomAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            createProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createProfileButton.topAnchor.constraint(equalTo: newRequestButton.bottomAnchor, constant: 15)
            ])
    }


}

