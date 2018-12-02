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
    
    var scrollView: UIScrollView!
    
    var nameLabel: UILabel!
    var nameInput: UITextField!
    
    var emailLabel: UILabel!
    var emailInput: UITextField!
    
    var netLabel: UILabel! //net ID
    var netInput: UITextField!
    
    var yearLabel: UILabel! //Gradaution year
    var yearInput: UITextField!
    
    var passLabel: UILabel! //password
    var passInput: UITextField!
    
    var majorLabel: UILabel!
    var majorInput: UITextField!
    
    var minorLabel: UILabel!
    var minorInput: UITextField!
    
    var blurbLabel: UILabel! //can act as 'caption' in the profile view
    var blurbInput: UITextField!
    
    var skillsLabel: UILabel!
    var skillsInput: UITextField!
    
    var roleLabel: UILabel!
    var roleInput: UITextField!
    
    var photoLabel: UILabel! //profile photo
    //    var photoInput: UITextView!
    
    let padding: CGFloat = 12
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
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(nameLabel)
        
        nameInput = UITextField()
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        nameInput.placeholder = "Your name"
//        nameInput.font = .systemFont(ofSize: textSize)
        nameInput.borderStyle = .roundedRect
        scrollView.addSubview(nameInput)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "E-mail"
        emailLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(emailLabel)
        
        emailInput = UITextField()
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.placeholder = "Contact email"
//        emailInput.font = .systemFont(ofSize: textSize)
        emailInput.borderStyle = .roundedRect
        scrollView.addSubview(emailInput)
        
        netLabel = UILabel()
        netLabel.translatesAutoresizingMaskIntoConstraints = false
        netLabel.text = "Net ID"
        netLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(netLabel)
        
        netInput = UITextField()
        netInput.translatesAutoresizingMaskIntoConstraints = false
        netInput.placeholder = "Cornell Net ID"
//        netInput.font = .systemFont(ofSize: textSize)
        netInput.borderStyle = .roundedRect
        scrollView.addSubview(netInput)
        
        yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.text = "Class Of"
        yearLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(yearLabel)
        
        yearInput = UITextField()
        yearInput.translatesAutoresizingMaskIntoConstraints = false
        yearInput.placeholder = "e.g 2020"
//        yearInput.font = .systemFont(ofSize: textSize)
        yearInput.borderStyle = .roundedRect
        scrollView.addSubview(yearInput)
        
        passLabel = UILabel()
        passLabel.translatesAutoresizingMaskIntoConstraints = false
        passLabel.text = "Password"
        passLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(passLabel)
        
        passInput = UITextField()
        passInput.translatesAutoresizingMaskIntoConstraints = false
        passInput.placeholder = "Enter password"
        //TODO - display as dots
//        passInput.font = .systemFont(ofSize: textSize)
        passInput.borderStyle = .roundedRect
        scrollView.addSubview(passInput)
        
        majorLabel = UILabel()
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        majorLabel.text = "Major"
        majorLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(majorLabel)
        
        majorInput = UITextField()
        majorInput.translatesAutoresizingMaskIntoConstraints = false
        majorInput.placeholder = "Enter your major"
//        majorInput.font = .systemFont(ofSize: textSize)
        majorInput.borderStyle = .roundedRect
        scrollView.addSubview(majorInput)
        
        minorLabel = UILabel()
        minorLabel.translatesAutoresizingMaskIntoConstraints = false
        minorLabel.text = "Minor"
        minorLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(minorLabel)
        
        minorInput = UITextField()
        minorInput.translatesAutoresizingMaskIntoConstraints = false
        minorInput.placeholder = "Enter your minor"
//        minorInput.font = .systemFont(ofSize: textSize)
        minorInput.borderStyle = .roundedRect
        scrollView.addSubview(minorInput)
        
        blurbLabel = UILabel()
        blurbLabel.translatesAutoresizingMaskIntoConstraints = false
        blurbLabel.text = "About"
        blurbLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(blurbLabel)
        
        blurbInput = UITextField()
        blurbInput.translatesAutoresizingMaskIntoConstraints = false
        blurbInput.placeholder = "Fun facts about yourself"
//        blurbInput.font = .systemFont(ofSize: textSize)
        blurbInput.borderStyle = .roundedRect
        scrollView.addSubview(blurbInput)
        
        skillsLabel = UILabel()
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        skillsLabel.text = "Skills"
        skillsLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(skillsLabel)
        
        skillsInput = UITextField()
        skillsInput.translatesAutoresizingMaskIntoConstraints = false
        skillsInput.placeholder = "Separate with a comma"
//        skillsInput.font = .systemFont(ofSize: textSize)
        skillsInput.borderStyle = .roundedRect
        scrollView.addSubview(skillsInput)
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Primary Role"
        roleLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(roleLabel)
        
        roleInput = UITextField()
        roleInput.translatesAutoresizingMaskIntoConstraints = false
        roleInput.placeholder = "Enter your primary role"
//        roleInput.font = .systemFont(ofSize: textSize)
        roleInput.borderStyle = .roundedRect
        scrollView.addSubview(roleInput)
        
        setupConstraints()
        
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: padding*2),
            nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding*2),
            
            nameInput.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            nameInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameInput.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding*2)
            ])
        
        NSLayoutConstraint.activate([
            netLabel.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: padding*2),
            netLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            netInput.topAnchor.constraint(equalTo: netLabel.bottomAnchor, constant: padding),
            netInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            netInput.trailingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: netLabel.topAnchor),
            yearLabel.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: padding),
            
            yearInput.topAnchor.constraint(equalTo: netInput.topAnchor),
            yearInput.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor),
            yearInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: yearInput.bottomAnchor, constant: padding*2),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            emailInput.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: padding),
            emailInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            passLabel.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: padding*2),
            passLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            passInput.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: padding),
            passInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            passInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: passInput.bottomAnchor, constant: padding*2),
            majorLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            majorInput.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: padding),
            majorInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            majorInput.trailingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            minorLabel.topAnchor.constraint(equalTo: majorLabel.topAnchor),
            minorLabel.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: padding),
            
            minorInput.topAnchor.constraint(equalTo: majorInput.topAnchor),
            minorInput.leadingAnchor.constraint(equalTo: minorLabel.leadingAnchor),
            minorInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            blurbLabel.topAnchor.constraint(equalTo: minorInput.bottomAnchor, constant: padding*2),
            blurbLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            blurbInput.topAnchor.constraint(equalTo: blurbLabel.bottomAnchor, constant: padding),
            blurbInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            blurbInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])

        NSLayoutConstraint.activate([
            skillsLabel.topAnchor.constraint(equalTo: blurbInput.bottomAnchor, constant: padding*2),
            skillsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            skillsInput.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: padding),
            skillsInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            skillsInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: skillsInput.bottomAnchor, constant: padding*2),
            roleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            roleInput.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: padding),
            roleInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            roleInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor),
            roleInput.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -padding*2)
            ])
    }
    
}
