//
//  CreateProfileViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/27/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
//wip

class CreateProfileViewController: UIViewController {
    
    var nameLabel: UILabel!
    var nameInput: UITextField!
    
    var netLabel: UILabel! //net ID
    var netInput: UITextField!
    
    var yearLabel: UILabel! //Gradaution year
    var yearInput: UITextField!
    
    var majorLabel: UILabel!
    var majorInput: UITextField!
    
    var minorLabel: UILabel!
    var minorInput: UITextField!
    
    var roleLabel: UILabel!
    var roleInput: UITextField!
    
    var emailLabel: UILabel!
    var emailInput: UITextField!
    
    var skillsLabel: UILabel!
    var skillsInput: UITextField!
    
    var photoLabel: UILabel! //profile photo
    //    var photoInput: UITextView!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 32
    let textSize: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Create Account"
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        let postButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = postButton
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(nameLabel)
        
        nameInput = UITextField()
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        nameInput.placeholder = "Your name"
        nameInput.font = .systemFont(ofSize: textSize)
        nameInput.borderStyle = .roundedRect
        view.addSubview(nameInput)
        
        netLabel = UILabel()
        netLabel.translatesAutoresizingMaskIntoConstraints = false
        netLabel.text = "Net ID"
        netLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(netLabel)
        
        netInput = UITextField()
        netInput.translatesAutoresizingMaskIntoConstraints = false
        netInput.placeholder = "Cornell Net ID"
        netInput.font = .systemFont(ofSize: textSize)
        netInput.borderStyle = .roundedRect
        view.addSubview(netInput)
        
        majorLabel = UILabel()
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        majorLabel.text = "Major"
        majorLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(majorLabel)
        
        majorInput = UITextField()
        majorInput.translatesAutoresizingMaskIntoConstraints = false
        majorInput.placeholder = "Enter your major"
        majorInput.font = .systemFont(ofSize: textSize)
        majorInput.borderStyle = .roundedRect
        view.addSubview(majorInput)
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Primary Role"
        roleLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(roleLabel)
        
        roleInput = UITextField()
        roleInput.translatesAutoresizingMaskIntoConstraints = false
        roleInput.placeholder = "Enter your primary role"
        roleInput.font = .systemFont(ofSize: textSize)
        roleInput.borderStyle = .roundedRect
        view.addSubview(roleInput)
        
        setupConstraints()
        
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*2),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2)
            ])
        
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            nameInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2)
            ])
        
        NSLayoutConstraint.activate([
            netLabel.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: padding*2),
            netLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            netLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            netInput.topAnchor.constraint(equalTo: netLabel.bottomAnchor, constant: padding),
            netInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            netInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: netInput.bottomAnchor, constant: padding*2),
            majorLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            majorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            majorInput.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: padding),
            majorInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            majorInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: majorInput.bottomAnchor, constant: padding*2),
            roleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            roleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            roleInput.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: padding),
            roleInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            roleInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        // TODO - add rest of labels and fields
    }
    
}
